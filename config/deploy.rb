require 'bundler/capistrano'

default_run_options[:pty] = true
set :default_environment, {
  "PATH" => "/opt/rbenv/shims:/opt/rbenv/bin:$PATH"
}

set :ssh_options, { :forward_agent => true }
set :application, "koresol"
set :repository, "https://github.com/nitrepo/bfskoresol.git"
set :user, "root"

set :use_sudo, false

server "128.199.151.8", :web, :app, :db, :primary => true

after "deploy:finalize_update", "symlink:all"

namespace :symlink do
  task :db do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  task :all do
    symlink.db
  end
end

namespace :deploy do

  task :start do
    run "#{current_path}/bin/unicorn -Dc #{shared_path}/config/unicorn.rb -E #{rails_env} 
#{current_path}/config.ru"
  end

  task :restart do
    run "kill -USR2 $(cat #{shared_path}/pids/unicorn.pid)"
  end

end

after "deploy:restart", "deploy:cleanup"
