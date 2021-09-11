#!/bin/bash

cd modules
./install_apt.sh
./install_flatpak.sh
./remove.sh

# upgrades and clean up
sudo apt upgrade -y
sudo apt autoremove

# see bash changes
source ~/.bashrc
