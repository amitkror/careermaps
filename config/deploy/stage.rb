set :stage, :stage

set :branch, 'stage'
set :deploy_to, '/var/www/stage.careermaps.bbox.ly'
set :rails_env, :stage

role :app, %w{eggo.blenderbox.com}
role :web, %w{eggo.blenderbox.com}
role :db,  %w{eggo.blenderbox.com}

server 'eggo.blenderbox.com', user: 'deploy-career-maps', roles: %w{web app db}, port: 837, branch: 'stage'
