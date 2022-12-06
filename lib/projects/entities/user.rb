# ROM has a feature called entities
# these are simple classes that can be considered as super-powered strucs

# we've called this class Projects::Entities::User
# this class will be autoloaded by zeitwerk the moment any part of our code
# attempts to reference this constant
# that way we wont have to require it ourselves anywhere
module Projects
  module Entities
    class User < ROM::Struct
      def full_name
        "#{first_name} #{last_name}"
      end
    end
  end
end
