require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CareerMaps
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.compass.sass_dir = 'app/stylesheets'

    config.generators do |g|
      g.assets false
      g.helper false
    end

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.assets.paths << Rails.root.join('vendor','assets','bower_components')

    # Precompile additional assets
    config.assets.precompile += %w(
      images/*

      tinymce/*js
      tinymce/themes/*js
      tinymce/plugins/*js

      admin.js
      admin/*.js
      app/*.js
      libs/*.js

      admin/*.scss
      admin.css
      admin/tinymce.css
      admin/toolbar.css

      app/home/home.scss
      app/footer.scss

      application.css
    )
  end
end
