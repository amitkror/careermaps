# Use this file to easily define all of your cron jobs.
#

env :PATH, '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

case environment
when 'stage'
  set :output, "/var/www/stage.careermaps.bbox.ly/shared/log/cron.log"
when 'production'
  set :output, {
    error: '/var/www/careers.nyccollegeline.org/shared/log/cron_error.log',
    standard: '/var/www/careers.nyccollegeline.org/shared/log/cron.log'
  }
else
  set :output, "/var/null"
end


=begin
every 1.day, at: ':00' do
  rake 'backup'
end
=end
