#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Script requires 2 parameters. Git username and email"
    exit 1
fi

# apt-get update and upgrade
sudo apt-get -y update
sudo apt-get -y upgrade

# install diffuse
echo "\n\n"
echo "installing diffuse"
sudo apt-get install -y diffuse

# configure git
echo "\n\n"
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

# install python related stuff
echo "\n\n"
echo "installing python stuff"
sudo apt-get install -y build-essential python-dev python-yaml \
python-setuptools ipython pylint python-pip python-imaging virtualenvwrapper

# install vim
echo "\n\n"
echo "installing vim"
sudo apt-get install -y vim

# install ssh server
echo "\n\n"
echo "installing openssh server"
sudo apt-get install -y openssh-server

# install postgres
echo "\n\n"
echo "installing postgres"
sudo apt-get install -y postgresql pgadmin3

# final clean up
echo "\n\n"
echo "doing final clean up"
sudo apt-get -fy install
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y autoclean
sudo apt-get -y autoremove

echo "\n\n"
echo "done"
