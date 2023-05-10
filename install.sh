#!/bin/bash
# install work apps
sudo pacman -Syu
sudo pacman -S discord keepassxc neovim zathura zathura-pdf-mupdf flatpak pdfarranger xournalpp

flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

yay -S timeshift protonvpn spotify

# remove unnecessary apps
sudo pacman -Rns nano
rm .nanorc

# symlinks
create_config_link() {
    # Create the symlink to the .config directory
    local ARG=$1
    ln -sf $HOME/.dotfiles/configs/.config/$ARG $HOME/.config/$ARG
    echo "Symbolic link created successfully!"
}

create_config_link ../.vimrc
create_config_link ../.gitconfig
create_config_link zathura
create_config_link nvim
