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
yay -S discord spotify keepassxc pdfarranger xournalpp flatpak fonts-font-awesome protonvpn nwg-look xfce4-terminal

# app distribution; mainly used for access towards obsidian
flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

# catppuccin theme
yay -S catppuccin-gtk-theme-macchiato papirus-icon-theme papirus-folders-catppuccin-git
papirus-folders -C cat-macchiato-mauve

# emacs
yay -S emacs ripgrep
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

# git
create_symlink configs/.gitconfig ~/

# kitty
yay -S kitty
create_symlink configs/kitty

# mako
yay -S mako
create_symlink configs/mako

# nemo
yay -S nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

# nvim
yay -S neovim
create_symlink configs/nvim

# sddm
yay -S sddm-git sddm-sugar-candy-git
sudo systemctl enable sddm.service
sudo cp -i /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf

# sway
create_symlink configs/sway

# swaylock
yay -S swaylock-effects-git
create_symlink configs/swaylock

# timeshift
yay -S timeshift
sudo systemctl enable cronie.service

# waybar
yay -S waybar-git
create_symlink configs/waybar

# wofi
create_symlink configs/wofi

# zathura
yay -S zathura zathura-pdf-mupdf
create_symlink configs/zathura

# zsh
yay -S zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
zsh
# place in zsh file
# setopt PROMPT_CR
# setopt PROMPT_SP
# export PROMPT_EOL_MARK=""

#
# remove unnecessary apps
#
sudo pacman -Rns nano
rm .nanorc

ssh-keygen -t ed25519 -C "luke.bk.le@gmail.com"
cat ~/.ssh/id_ed25519.pub
