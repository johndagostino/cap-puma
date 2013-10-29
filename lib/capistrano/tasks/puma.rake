namespace :puma do
  before 'deploy:started', :configure do
    set :puma_cmd, "bundle exec puma"
    set :pumactl_cmd, "bundle exec pumactl"
    set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
    set :puma_state, "#{shared_path}/sockets/puma.state"
    set :puma_socket, "unix://#{shared_path}/sockets/puma.sock"
    set :puma_role, :app
  end

  desc 'Start puma'
  task :start do
    on roles fetch(:puma_role) do
      run "#{puma_cmd} #{start_options}", :pty => false
    end
  end

  desc 'Stop puma'
  task :stop do
    on roles fetch(:puma_role) do
      within release_path do
        run "#{pumactl_cmd} -S #{state_path} stop"
      end
    end
  end

  desc 'Restart puma'
  task :restart do
    on roles fetch(:puma_role) do
      within release_path do
        begin
          run "#{pumactl_cmd} -S #{state_path} restart"
        rescue Capistrano::CommandError => ex
          puts "Failed to restart puma: #{ex}\nAssuming not started."
          start
        end
      end
    end
  end

  desc 'Restart puma (phased restart)'
  task :phased_restart do
    on roles fetch(:puma_role) do
      within release_path do
        run "#{pumactl_cmd} -S #{state_path} phased-restart"
      end
    end
  end

  def start_options
    if config_file
      "-q -d -e #{puma_env} -C #{config_file}"
    else
      "-q -d -e #{puma_env} -b '#{puma_socket}' -S #{state_path} --control 'unix://#{shared_path}/sockets/pumactl.sock'"
    end
  end

  def config_file
    @_config_file ||= begin
      file = fetch(:puma_config_file, nil)
      file = "./config/puma/#{puma_env}.rb" if !file && File.exists?("./config/puma/#{puma_env}.rb")
      file
    end
  end

  def puma_env
    fetch(:rack_env, fetch(:rails_env, 'production'))
  end

  def state_path
    (config_file ? configuration.options[:state] : nil) || puma_state
  end

  def configuration
    require 'puma/configuration'

    config = Puma::Configuration.new(:config_file => config_file)
    config.load
    config
  end

  after 'deploy:finishing', :reset
end
