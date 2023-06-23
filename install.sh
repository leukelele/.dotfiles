#!/bin/bash

#####################################################################################
# todo:                                                                             #
# - [x] include in script to download and set zsh as default                        #
# - [x] zsh themes                                                                  #
# - [x] install and make default sddm for login manager                             #
# - [ ] sddm themes                                                                 #
# - [ ] grub cutsomization too                                                      #
# - [ ] go over script and rewrite for streamlining (to be done a later future)     #
#####################################################################################

#
# Get the directory paths used by the bash script
#
script_dir=$(dirname "$(readlink -f "${0:A}")")
dotconfig_dir=script_dir/configs/

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
# also creates necessary symlinks
#

# pacman wrapper for convenience
sudo pacman -Syu
sudo pacman -S yay

# apps
yay -S discord spotify keepassxc pdfarranger xournalpp flatpak fonts-font-awesome timeshift protonvpn nwg-look nemo xfce4-terminal kitty mako neovim swaylock-effects waybar-git wofi zathura zathura-pdf-mupdf zsh catppuccin-gtk-theme-macchiato papirus-icon-theme papirus-folders-catppuccin-git sddm-git sddm-sugar-candy-git

# app distribution; mainly used for access towards obsidian
flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

# catppuccin theme
papirus-folders -C cat-macchiato-mauve

# git
create_symlink configs/.gitconfig $HOME

# kitty
create_symlink configs/kitty

# mako
create_symlink configs/mako

# nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

# nvim
create_symlink configs/nvim

# sddm
sudo systemctl enable sddm.service
sudo cp -i /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf

# sway
create_symlink configs/sway

# swaylock
create_symlink configs/swaylock

# timeshift
sudo systemctl enable cronie.service

# waybar
create_symlink configs/waybar

# wofi
create_symlink configs/wofi

# zathura
create_symlink configs/zathura

# zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
create_symlink configs/.zshrc $HOME
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
zsh
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

#
# remove unnecessary apps
#
sudo pacman -Rns nano
rm .nanorc
