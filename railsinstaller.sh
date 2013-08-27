#!/bin/bash
#install rvm
curl -L https://get.rvm.io | bash -s

#get latest rvm
rvm get stable

#get requirement
rvm requirements

#install YAML library
sudo apt-get install libyaml-dev

#install openSSL
rvm install 2.0.0 --with-openssl-dir=~/.rvm/user

#enable rvm
source ~/.rvm/scripts/rvm

#use gemset
rvm use 2.0.0@rails_4_0 --create --default
