#!/bin/bash

echo "adding PPAs"
add-apt-repository ppa:daniruiz/flat-remix
add-apt-repository ppa:kgilmer/regolith-stable

echo "apt-get updating"
apt-get update
apt-get upgrade

echo "installing git, regolith and xfonts-terminux"
apt install git
apt install regolith-desktop
apt install xfonts-terminus

echo "installing flat-remix"
apt-get install flat-remix-gtk
apt-get install flat-remix

echo "Configuring colors, i3 and compton"
cp .Xresources-regolith ~
cp -r .Xresources.d ~
cp -r .config ~

echo "merging shit"
xrdb -merge ~/.Xresources-regolith

echo "installing & updating nodejs & npm"
apt install nodejs
apt install npm
npm i -g n
n latest

echo "installing & updating VSCode, Spotify, KeepassXC"
snap install code
snap install spotify
apt install keepassxc

echo "Restarting"
shutdown -r 0