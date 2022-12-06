# rom_dry_project

## main components

- `config/boot.rb` - Requires boot-level pieces of our application - such as `Bundler` and `dotenv`
- `config/application.rb` - Defines a `Container` for our application's configuration. Serves as the main entry point for our application
- `system/boot/db.rb` - Specifies how our application connects to a database
- `lib/projects/repos/user_repo.rb` - A class that contains methods for interacting with our relation allowing us to create + retrieve data from the database
- `lib/projects/relations/user.rb` - Defines a class that can contain query logic for our `users` table 


`ROM` and `Dry` separate our application into small, clearly defined pieces with individual responsabilites 
While this setup cost feels large now. it's a cost that we're only going to be paying once. 
Setups cost is one-time maintenance cost is forever
