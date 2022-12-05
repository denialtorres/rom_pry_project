# the system/boot directory is where we put system-level dependencies
# when using dry-system
# this new file that we created configures how our application defines its database connection

Projects::Application.boot(:db) do |app|
  init do
    require "rom"
    require "rom-sql"

    # the pg_timestampz extension will create timestamp with time zone columns in our database
    # rather than the default, which is timestamp without time zone

    # this means that times will be stored with time zone information in the database
    # and this means when we retrieve them Ruby wont add the system timezone on the end
    connection = Sequel.connect(ENV['DATABASE_URL'], extensions: %i[pg_timestamptz])
    register('db.connection', connection)
    register('db.config', ROM::Configuration.new(:sql, connection))
  end

  start do
    register('db.container', ROM.container(app['db.config']))
  end
end
