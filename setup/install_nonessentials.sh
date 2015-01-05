# install chrome
echo "\n\n"
echo "installing chrome"
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -fy install

# install ccsm for alt-tab fix
echo "\n\n"
echo "installing ccsm"
sudo apt-get install -y compizconfig-settings-manager

# fix scrollbar and menus
echo "\n\n"
echo "fixing scrollbar and menus"
sudo apt-get -y purge "scrollbar*"
sudo apt-get autoremove appmenu-gtk appmenu-gtk3 appmenu-qt

# install wingide
echo "\n\n"
echo "installing wingide"
cd /tmp
sudo apt-get -y install enscript
wget http://wingware.com/pub/wingide/4.1.14/wingide4.1_4.1.14-1_amd64.deb
sudo dpkg -i wingide4.1_4.1.14-1_amd64.deb
sudo apt-get -fy install

# install geany
echo "\n\n"
echo "installing geany"
sudo apt-get -y install geany

# install microsoft fonts
echo "\n\n"
echo "installing fonts"
sudo apt-get install -y ubuntu-restricted-extras

# install adobe reader
echo "\n\n"
echo "installing adobe reader"
sudo apt-add-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install -y acroread

echo "\n\n"
echo "done"


