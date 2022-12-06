# relations run queries to get data out of a database
# repositories define methods to work data returned by relations
module Projects
  module Repos
    class UserRepo < ROM::Repository[:users]
    end
  end
end
