require_relative 'config/application'
require 'rom-sql'
require 'rom/sql/rake_task'

# in order to tell Rom's rake tasks where our database lives, we're required to setup
# a Rake task of our own called db:setup
# This configuration starts the system-level dependency :db by calling start
# on Projects::Application

# this will run the code inside  the init block defined inside system/boot/db.rb
namespace :db do
  task :setup do
    Projects::Application.start(:db)
    # we can retrieve the value by using Projects::Application['db.config']
    # ROM will then use this value to talk to our database
    config = Projects::Application['db.config']
    # using this configuration we configure something called the default gateway
    # which is the simply the default database connection that ROM has been configured with
    # using the default gateway, we tell it ot use a new Logger instance, which will log SQL
    # output for our Rake tasks
    config.gateways[:default].use_logger(Logger.new($stdout))
  end
end
