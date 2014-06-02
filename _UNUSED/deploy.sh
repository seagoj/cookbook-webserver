#!/bin/bash

# Usage: ./deploy.sh [host] [port]

host="${1:-vagrant@127.0.0.1}"
port="${2:-2222}"
pass="${3:-vagrant}"

# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
ssh-keygen -R "${host#*@}" 2> /dev/null

tar cj . | ssh -o 'StrictHostKeyChecking no' "$host" -p "$port" '
"$pass"
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef &&
#tar xj &&
sudo bash /vagrant/install.sh'