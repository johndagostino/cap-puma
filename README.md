# Capistrano Puma Rake Tasks

Puma Rake tasks for Capistrano >= 3.0.0

These tasks have been taken directly from the puma gem and upgraded to Rake

Includes the following commands;

  - `cap puma:start`
  - `cap puma:restart`
  - `cap puma:phased_restart`
  - `cap puma:stop`
  - `cap puma:upstart:start`
  - `cap puma:upstart:restart`
  - `cap puma:upstart:stop`

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano',  '~> 3.0.0'
    gem 'cap-puma'

And then execute:

    $ bundle --binstubs
    $ cap install


To use upstart to manage the puma processes follow the instruction
https://github.com/puma/puma/tree/master/tools/jungle/upstart

## Usage

Add the following line to your Capfile

    require 'capistrano/puma'

to use upstart to control the puma daemon set :puma_upstart to true in your
environment file

    set :puma_upstart, true


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
