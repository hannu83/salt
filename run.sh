#!/bin/bash
# Copyright 2018 Tero Karvinen http://TeroKarvinen.com GPL 3
# Modified by Hannu Kankkunen 2018

echo "Live USB configuration Starting... hannukankkunen/liveusb"
set -o verbose

echo "Installing Salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "Retrieving and Applying Settings..."
echo 'master: 142.93.160.134'|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion

git clone https://github.com/hannu83/salt
cd salt/
./highstate.sh

echo "Configuring Live Desktop"
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
# git config --global user.email "hannu.kankkunen1@gmail.com"
# git config --global user.name "Hannu Kankkunen"

echo "More tips on http://terokarvinen.com/tag/saltstack"
echo "Done."
