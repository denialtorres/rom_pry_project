# relations run queries to get data out of a database
# repositories define methods to work data returned by relations

# this relation class inherits from ROM::Releation[:sql]
# and that will meant that our relation is used to talk to an SQL database
module Projects
  module Relations
    class Users < ROM::Relation[:sql]
      # the method schema this method says that our relation class is for a table called
      # users and that we should infer ther attributes for that schema
      # meaning ROM will look at the table to define attributes for this relation
      schema(:users, infer: true)
    end
  end
end
