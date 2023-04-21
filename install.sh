#!/bin/bash
# install necessary apps
sudo pacman -Syu
sudo pacman -S discord keepassxc neovim zathura zathura-pdf-mupdf flatpak pdfarranger xournalpp

flatpak update -y
flatpak install -y app/md.obsidian.Obsidian/x86_64/stable

yay -S timeshift protonvpn

# symlinks
create_config_link() {
    # Check if the argument is provided
    if [ $# -eq 0 ]; then
        echo "Usage: create_config_link <link-name>"
        return 1
    fi

    # Create the symlink to the .config directory
    ln -sf $HOME/.dotfiles/configs/.config/$ARG $HOME/.config/$ARG

    echo "Symbolic links created successfully!"
}

create_config_link ../.gitconfig
create_config_link zathura
create_config_link nvim
