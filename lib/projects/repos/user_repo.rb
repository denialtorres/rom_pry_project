# relations run queries to get data out of a database
# repositories define methods to work data returned by relations
module Projects
  module Repos
    class UserRepo < ROM::Repository[:users]
      # the `Import` constant will allow us to import (or inject)
      # anything registeded with out applicaiton in other parts
      # this will use the Import constant to inject the container dependency
      # into this class
      # this works by passing the container keyword argument to initialzie for this class
      include Import["db.container"]
      # struct_namespace method tells the repository that when it
      # builds structs it can use the projects namespace for those structs
      struct_namespace Projects::Entities
      # the commands class method defines built-in commands that we can use on our repository
      # ROM comes with three :create, update and :delete
      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def all
        users.to_a
      end
    end
  end
end
