# rom_dry_project

## summary
setup a small application that can talk to a database using the `dry-system` and `dry-auto_inject` gems
along with rom and rom-sql

## main components

- `config/boot.rb` - Requires boot-level pieces of our application - such as `Bundler` and `dotenv`
- `config/application.rb` - Defines a `Container` for our application's configuration. Serves as the main entry point for our application
- `system/boot/db.rb` - Specifies how our application connects to a database
- `lib/projects/repos/user_repo.rb` - A class that contains methods for interacting with our relation allowing us to create + retrieve data from the database
- `lib/projects/relations/user.rb` - Defines a class that can contain query logic for our `users` table

## main sections
- `entities` Classes that represent specific data types. These are used by the `repository` to represent data from the database, but the main thin here is that they can be used in complete isolation
- `relations` Classes that can contain custom methods for querying the database. When we write complicated queries to get data from our db, this is now where the code will go
- `repos` Classes that provide a place for defining a public API between `relations` and our application code.
Provides a clean API between the relations and the entitites, Uses relations to fetch data from a database and use entities to represent that data


`ROM` and `Dry` separate our application into small, clearly defined pieces with individual responsabilites
While this setup cost feels large now. it's a cost that we're only going to be paying once.
Setups cost is one-time maintenance cost is forever
