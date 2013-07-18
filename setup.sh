#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 
#installing basic tool
sudo apt-get install -y curl vim

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/danggrianto/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.vim .

#sublime text connector
sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rsub

#git setup and aliases
git config --global user.name "daniel anggrianto"
git config --global user.email "d.anggrianto@gmail.com"
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.com commit
