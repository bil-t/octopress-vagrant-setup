#!/bin/bash -x
cd
pwd
#ruby installation
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="~/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 1.9.3-p0
rbenv local 1.9.3-p0
rbenv rehash
ruby --version

#Setup Octopress
cd /vagrant
rbenv local 1.9.3-p0
git clone git://github.com/imathis/octopress.git octopress
cd octopress
#bind server to all inetrfaces
sed -i.bak '/^server_port/a server_host     = "0.0.0.0"   # server bind address for preview server' Rakefile
sed -i.bak 's/rackup --port #{server_port}/rackup --host #{server_host} --port #{server_port}/g' Rakefile
#install dependencies
gem install bundler
rbenv rehash
bundle install
#install default theme
rake install
