#!/bin/bash -x
apt-get update
apt-get install -y nedit
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y git
git config --global user.name bil-t
git config --global user.email bil-t@users.noreply.github.com

su -c "source /vagrant/vagrant/user-config.sh" vagrant