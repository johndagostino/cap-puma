# Capistrano::Puma

Puma Rake tasks for Capistrano >= 3.0.0

These tasks have been taken directly from the puma gem

Includes the following commands;

  - `cap puma:start`
  - `cap puma:reset`
  - `cap puma:phased_restart`
  - `cap puma:stop`

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano',  '~> 3.0.0'
    gem 'cap-puma'

And then execute:

    $ bundle --binstubs
    $ cap install

## Usage

Add the following line to your Capfile

    require 'capistrano/puma'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
