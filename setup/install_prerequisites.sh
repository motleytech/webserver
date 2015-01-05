#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Script requires 2 parameters. Git username and email"
    exit 1
fi

# configure git
echo "configuring git"
git config --global user.name $1
git config --global user.email $2
git config --global alias.st "status"
git config --global alias.stat "status"
git config --global alias.wdiff "diff --color-words"
git config --global merge.tool diffuse
git config --global merge.summary true
git config --global difftool.prompt false
git config --global diff.tool diffuse
git config --global color.ui true

# install chrome
echo "installing chrome"
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -fy install

# install ccsm for alt-tab fix
echo "installing ccsm"
sudo apt-get install -y compizconfig-settings-manager

# fix scrollbar and menus
echo "fixing scrollbar and menus"
sudo apt-get -y purge "scrollbar*"
sudo apt-get autoremove appmenu-gtk appmenu-gtk3 appmenu-qt

# installing python stuff
echo "installing python stuff"
sudo apt-get install -y build-essential python-dev python-yaml \
python-setuptools ipython pylint python-pip python-imaging virtualenvwrapper

# install wingide
echo "installing wingide"
cd /tmp
sudo apt-get -y install enscript
wget http://wingware.com/pub/wingide/4.1.14/wingide4.1_4.1.14-1_amd64.deb
sudo dpkg -i wingide4.1_4.1.14-1_amd64.deb
sudo apt-get -fy install

# install geany
echo "installing geany"
sudo apt-get -y install geany

# install microsoft fonts
echo "installing fonts"
sudo apt-get install -y ubuntu-restricted-extras

# install diffuse
echo "installing diffuse"
sudo apt-get install -y diffuse

# install adobe reader
echo "installing adobe reader"
sudo apt-add-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install -y acroread

# install vim
echo "installing vim"
sudo apt-get install -y vim

# install ssh server
echo "installing openssh server"
sudo apt-get install -y openssh-server

# install postgres
echo "installing postgres"
sudo apt-get install -y postgresql pgadmin3

# final clean up
echo "doing final clean up"
sudo apt-get -fy install
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove

echo "done"
