if defined? AssetSync
  AssetSync.configure do |config|
    config.fog_provider = Rails.application.secrets.fog_provider
    config.aws_access_key_id = Rails.application.secrets.aws_access_key_id
    config.aws_secret_access_key = Rails.application.secrets.aws_secret_access_key
    config.fog_directory = Rails.application.secrets.fog_directory

    # Increase upload performance by configuring your region
    # config.fog_region = 'eu-west-1'
    #
    # Don't delete files from the store
    config.existing_remote_files = "delete"
    #
    # Automatically replace files with their equivalent gzip compressed version
    config.gzip_compression = true
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to
    # upload instead of searching the assets directory.
    # config.manifest = true
    #
    # Fail silently.  Useful for environments such as Heroku
    config.fail_silently = false
  end
end
