server {
  server_name stage.careermaps.bbox.ly;
  root /var/www/stage.careermaps.bbox.ly/current/public;
  access_log  /var/www/stage.careermaps.bbox.ly/shared/log/nginx_access.log;
  error_log /var/www/stage.careermaps.bbox.ly/shared/log/nginx_error.log;

  include  options/rails_stage.conf;

  location / {
    passenger_enabled on;
    include  options/restrict.conf;
  }

  location ~ ^/(robots\.txt|humans\.txt|favicon\.ico|apple-touch-icon(.*)\.png).*$ {
    access_log off;
    expires 30d;
    log_not_found off;
    add_header Cache-Control public;
  }
}
