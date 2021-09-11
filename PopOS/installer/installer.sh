#!/bin/bash

cd modules
./install_apt.sh
./install_flatpak.sh

# upgrades all
sudo apt upgrade -y

# see bash changes
source ~/.bashrc
