#!/bin/bash
version=$(cat .version/name)
source .install/includes/colors.sh
source .install/includes/library.sh
clear

# Set installation mode
mode="live"
if [ ! -z $1 ]; then
    mode="dev"
    echo "IMPORTANT: DEV MODE ACTIVATED. "
    echo "Existing dotfiles folder will not be modified."
    echo "Symbolic links will not be created."
fi

echo -e "${GREEN}"
cat <<"EOF"
         _       _    __ _ _           
      __| | ___ | |_ / _(_) | ___  ___ 
     / _  |/ _ \| __| |_| | |/ _ \/ __|
  _ | (_| | (_) | |_|  _| | |  __/\__ \
 (_) \___/ \___/ \__|_| |_|_|\___||___/
                                                                 
EOF
echo -e "${NONE}"

echo "Version: $version"
echo "by Stephan Raabe (modified by Luke Le) 2024"
echo ""

if [ -d ~/.dotfiles ] ;then
    echo "A .dotfiles installation has been detected."
    echo "This script will guide you through the update process of the .dotfiles."
else
    echo "This script will guide you through the installation process of the .dotfiles."
fi
echo ""

source .install/required.sh
source .install/paru.sh
source .install/confirm-start.sh
source .install/updatesystem.sh
