#!/bin/bash

echo -e "\nAdding PPAs\n"
add-apt-repository ppa:daniruiz/flat-remix -y
add-apt-repository ppa:kgilmer/regolith-stable -y

echo -e "\napt-get updating\n"
apt-get update -y
apt-get upgrade -y

echo -e "\nInstalling curl, regolith and xfonts-terminux\n"
apt-get install curl -y
apt-get install dconf-editor -y
apt-get install regolith-desktop -y
apt-get install xfonts-terminus -y

echo -e "\nInstalling flat-remix\n"
apt-get install flat-remix-gtk -y
apt-get install flat-remix -y

echo -e "\nConfiguring colors, i3 and compton\n"
cp .Xresources-regolith ~
cp -r .Xresources.d ~
cp -r .config ~

echo -e "\nMerging Xresources...\n"
xrdb -merge ~/.Xresources-regolith

echo -e "\nInstalling & updating nodejs, npm, chromium\n"
apt-get install nodejs -y
apt-get install npm -y
npm i -g n
n latest
apt-get install chromium-browser -y

echo -e "\nConfiguring keyboard shortcuts\n"
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source ['<Alt>Shift_L']
dconf write /org/gnome/desktop/wm/keybindings/switch-input-source-backward ['<Alt>Shift_L']

echo -e "\nInstalling & updating VSCode, Spotify, KeepassXC\n"
snap install code
snap install spotify
apt-get install keepassxc -y

echo -e "\nCleanup\n"
apt remove dconf-editor -y
apt autoremove

echo -e "\nRestarting\n"
shutdown -r 0