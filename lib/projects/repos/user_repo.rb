# relations run queries to get data out of a database
# repositories define methods to work data returned by relations
module Projects
  module Repos
    class UserRepo < ROM::Repository[:users]
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
