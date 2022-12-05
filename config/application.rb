# to setup our application envirometn and use this database configuration we're going
# to use that dry-system gem
require_relative "boot"


# This code is responsible for loading our boot.rb file and defining a Projects::Application Container
# this container is reponsible for automatically loading dependencias from lib
require 'pry'
require "dry/system/container"
require "dry/system/loader/autoloading"


module Projects
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path('..', __dir__)
      config.component_dirs.loader = Dry::System::Loader::Autoloading
      config.component_dirs.add_to_load_path = false

      # Add a 'lib' component dir (relative to `root`), containing class definitions
      # that can be auto-registered
      config.component_dirs.add 'lib'
    end
  end
end
loader = Zeitwerk::Loader.new
loader.push_dir Projects::Application.config.root.join("lib").realpath
loader.setup

# this container is also responsible for handling how system-level dependencies for our app
# are loaded, like how our app connects to the database
