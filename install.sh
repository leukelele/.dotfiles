#!/bin/bash

#
# Get the directory paths used by the bash script
#
script_dir=$(dirname "$(readlink -f "${0:A}")")
dotconfig_dir=script_dir/configs/.config

#
# given two directories, creates a symlink of the original directory in dest. directory
#
create_symlink() {
    original_dir=$1
    symlink_dir=$2

    if [ $# -eq 0 ]; then
        original_dir="$dotconfig_dir"/*
        symlink_dir="$HOME/.config"

    elif [ $# -eq 1 ]; then
        original_dir="$script_dir/$1"
        symlink_dir="$HOME/.config"

    else 
        original_dir="$script_dir/$1"
        symlink_dir="$2"
    fi

    ln -sf "$original_dir" "$symlink_dir"
}

#
# install apps and necessities
#

# pacman wrapper for convenience
sudo pacman -Syu
sudo pacman -S yay

# apps
yay -S discord keepassxc neovim zathura zathura-pdf-mupdf pdfarranger spotify xournalpp 

# app distribution; mainly used for access towards obsidian
yay -S flatpak
flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

#
# install dotfile dependencies and create necessary symlinks
#
yay -S mako swaylock-effects wofi waybar-hyprland-git timeshift protonvpn nwg-look nemo xfce4-terminal kitty

#
# remove unnecessary apps
#
sudo pacman -Rns nano
rm .nanorc
