# Career Maps

* Ruby 2.1.0

* Requires ImageMagick and PostgreSQL

* Configuration can be found in the config directory

* Simple rails site. Server is 14.04 Ubuntu, running Passenger 5.0 (I know!), Rails 4.1.1.

## Development

Install the gems

    bundle

Set up the database

    cp config/database.yml.example config/database.yml

Update config/database.yml with your settings.

    rake db:setup

The seeds.db should run, giving you a seeded database.
Refer to this file for the dummy user login.

Run

    rails s


## Deployment

We are deploying with capistrano 3.0.  Configuration can be found in config/deploy.rb and config/deploy/*

    cap <environment> deploy


i.e.

    git push origin master:production

    cap production deploy
