# the first line of code sets up an APP_ENV enviroment variable
# unles it has already been set on the process
ENV['APP_ENV'] ||= "development"

# the second and third lines of code here will setup Bundler, which add our gem
# dependencies paths to Ruby load path, so that we can require them when we need to
# Note that Bundler.setup is different from Bundler.require (Like in a Rails App)
# Bundler.setup only adds to the load path. and does not require everything at the beginning
require 'bundler'

# The two args passed here to Bundler.setup tell Bundler to include all gems outside of a group
# and all gems inside of a group name afther whatever APP_ENV is set to. which is
# 'development'
Bundler.setup(:default, ENV["APP_ENV"])

# the first gem that we require is dotenv, and that is just so we can load the .env or .env.
# {APP_ENV} files. when we're working locally. we'll want to have a .env.development file
# that specifies our local database URL
require "dotenv"

Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")
