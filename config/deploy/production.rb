set :stage, :production

set :branch, 'production'
set :deploy_to, '/var/www/careermaps.nyccollegeline.org'
set :rails_env, :production

role :app, %w{52.1.222.185}
role :web, %w{52.1.222.185}
role :db,  %w{52.1.222.185}

server '52.1.222.185', user: 'deploy', roles: %w{web app db}, port: 22, branch: 'production'
