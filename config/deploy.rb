set :application, 'career-maps'
set :repo_url, "git@bitbucket.org:blenderbox/#{fetch(:application)}.git"
set :scm, :git

##set :deploy_via, :remote_cache
set :format, :pretty
set :forward_agent, true
set :log_level, :debug
set :pty, true
set :use_sudo, false

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/dragonfly tmp/sessions tmp/sockets public/system}

set :default_env, { path: "/usr/local/bin:$PATH" }
set :keep_releases, 5

# bundler
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_roles, :all

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, "RAILS_ENV=#{fetch(:stage)} cache:clear"
      end
    end
  end

  after :finishing, 'deploy:cleanup'

  after :finishing, 'deploy:restart'
end
