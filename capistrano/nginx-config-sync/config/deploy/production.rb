set :app_env,        'production'
set :application,    "#{fetch(:application)}-#{fetch(:app_env)}"
set :deploy_to,      "/var/www/#{fetch(:application)}"
set :nginx_template, "config/deploy/templates/nginx-#{fetch(:app_env)}.erb"

server 'example.com',
  roles: %w{web app db}