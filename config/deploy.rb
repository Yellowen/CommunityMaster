# config valid only for current version of Capistrano
#lock '3.4.0'

#set :deploy_via, :remote_cache
set :pty, true
set :application, 'CommunityMaster'
set :repo_url, 'git@github.com:Yellowen/CommunityMaster.git'
set :user, 'web'
set :stages, ["production", "stage"]
set :stage, :production
set :default_stage, "production"
set :rails_env, 'production'
set :scm, :git
set :rbenv_ruby, '2.2.4'
set :rbenv_path, '/home/web/.rbenv/'
set :linked_files, ['config/secrets.yml', 'config/database.yml']
set :linked_dirs, fetch(:linked_dirs, []).push('public/app')
set :linked_dirs, fetch(:linked_dirs, []).push('public/templates')

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc "reload the database with seed data"
  task :seed do
    `cd #{current_path}; rake db:seed RAILS_ENV=production`
  end

  desc 'Runs rake db:drope create and migrate and seed'
  task :redb  do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:drop"
          execute :rake, "db:create"
          execute :rake, "db:migrate"
          execute :rake, "db:seed"
        end
      end
    end
  end

  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
        execute :rake, 'tmp:clear'
      end
    end
  end

  after :finishing, 'deploy:restart_passenger'
  #after :restart, :clear_cache do
  #  on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
  #  end
  #end

end
