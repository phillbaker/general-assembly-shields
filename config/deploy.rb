require "bundler/capistrano"
require "rvm/capistrano"

set :application, "ga.bling.phillbaker.com"

set :user, "capistrano"
set :repository,  "."
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :copy
set :copy_strategy, :export

set :scm, :git

set :rvm_type, :user

set :normalize_asset_timestamps, false

default_run_options[:shell] = '/bin/bash --login'

role :web, application                          # Your HTTP server, Apache/etc
role :app, application                          # This may be the same as your `Web` server

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
