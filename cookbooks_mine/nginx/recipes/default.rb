# --- Install packages we need ---
execute "apt-get-update" do
  command "apt-get update"
end

package 'php5-cgi'
package 'nginx'

# --- Set host name ---
# Note how this is plain Ruby code, so we can define variables to
# DRY up our code:
hostname = 'seagoj.com'

file '/etc/hostname' do
  content "#{hostname}\n"
end

service 'hostname' do
  action :restart
end

file '/etc/hosts' do
  content "127.0.0.1 localhost #{hostname}\n"
end

# --- Deploy a configuration file ---
# For longer files, when using 'content "..."' becomes too
# cumbersome, we can resort to deploying separate files:
cookbook_file '/etc/init.d/php-fastcgi' do
  source "php-fastcgi.d"
  mode "0777"
end

execute "start-php-fastcgi" do
  command "/etc/init.d/php-fastcgi start"
end

execute "install-php-as-service" do
  command "update-rc.d php-fastcgi defaults"
end

cookbook_file '/etc/nginx/sites-available/default' do 
    source "nginx.conf"
end

# This will copy cookbooks/op/files/default/apache2.conf (which
# you'll have to create yourself) into place. Whenever you edit
# that file, simply run "./deploy.sh" to copy it to the server.

service 'nginx' do
  action :restart
end