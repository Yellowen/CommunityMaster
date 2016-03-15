# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
# require 'capistrano/passenger'

#
 require 'capistrano/rbenv'
 require 'capistrano/bundler'
# require 'capistrano/passenger'
 require 'capistrano/linked_files'
 require 'capistrano/rails

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
