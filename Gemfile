source 'https://rubygems.org'

gem 'rails', '4.1.1'

gem 'asset_sync'
gem 'aws-sdk'
gem 'compass-rails'
gem 'chosen-rails'
gem 'devise'
gem 'dragonfly'
gem 'jquery-rails'
gem 'kaminari'
gem 'nested_form'
gem 'pg'
gem 'rack-cache', require: 'rack/cache'
gem 'sass-rails'
gem 'simple_form'
gem 'slim-rails'
gem 'tinymce-rails', git: 'git://github.com/blenderbox/tinymce-rails.git'
gem 'turbolinks'
gem 'uglifier'
gem 'factory_girl_rails'
gem 'unf' # This is required for security by asset_sync

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'quiet_assets'
  #gem 'rails_best_practices'
  gem 'rspec-rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'thin'
end

group :production, :stage do
  gem 'daemons'
  gem 'dalli'
  gem 'dragonfly-s3_data_store'
  gem 'exception_notification'
  gem 'fog'
  gem 'therubyracer', platforms: :ruby
  gem 'whenever', require: false
end
