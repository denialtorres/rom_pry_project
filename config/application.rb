# to setup our application envirometn and use this database configuration we're going
# to use that dry-system gem
require_relative "boot"


# This code is responsible for loading our boot.rb file and defining a Projects::Application Container
# this container is reponsible for automatically loading dependencias from lib
require "dry/system/container"

module Projects
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path('..', __dir__)
      config.default_namespace = 'projects'
      # here we tell to the dry-system gem to automatically require everything inside
      # the lib directory when our application is started
      config.auto_register = 'lib'
    end

    load_paths!('lib')
  end
end

# this container is also responsible for handling how system-level dependencies for our app
# are loaded, like how our app connects to the database
