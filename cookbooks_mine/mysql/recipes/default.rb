# --- Install packages we need ---
execute "apt-get-update" do
  command "apt-get update"
end

package 'mysql'

# This will copy cookbooks/op/files/default/apache2.conf (which
# you'll have to create yourself) into place. Whenever you edit
# that file, simply run "./deploy.sh" to copy it to the server.

service 'mysql' do
  action :restart
end