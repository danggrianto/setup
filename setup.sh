#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 
#installing basic tool
sudo apt-get install -y curl vim

sudo apt-get install -y git-core

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone git@github.com:danggrianto/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.vim .

#sublime text connector
#sudo wget -O /usr/local/bin/rsub https://raw.github.com/aurora/rmate/master/rmate
#sudo chmod +x /usr/local/bin/rsub

#git setup and aliases
git config --global user.name "daniel anggrianto"
git config --global user.email "d.anggrianto@gmail.com"
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.com commit

#installing hamachi
sudo apt-get install -y lsb-core
sudo apt-get -f install
wget https://secure.logmein.com/labs/logmein-hamachi_2.1.0.101-1_amd64.deb
sudo dpkg -i logmein-hamachi_2.1.0.101-1_amd64.deb
sudo hamachi login
sudo hamachi attach daniel_andy_ang@yahoo.com

#installing byobu - screen like
sudo apt-get install byobu
byobu-enable
