# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "rails_prac"
set :repo_url, "https://github.com/banananbo/rails_prac.git"
# デプロイ先でのソースのバージョンの保持数
set :keep_releases, 5

set :branch, ENV['BRANCH'] || "main"

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# ここからUnicornの設定
# Unicornのプロセスの指定
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの指定
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

# namespace :deploy do
#     task :start do
#       run "bundle exec unicorn -c #{current_path}/config/unicorn.rb -E production -D"
#     end
  
#     task :stop do
#       run "kill -QUIT `cat #{current_path}/tmp/pids/unicorn.pid`"
#     end

#     task :restart do
#       run "kill -USR2 `cat #{current_path}/tmp/pids/unicorn.pid`"
#       run "kill -QUIT `cat #{current_path}/tmp/pids/unicorn.pid.oldbin`"
#     end
# end

namespace :hogehoge do
    task :hello_world do
        puts "hello world!"
    end
end
