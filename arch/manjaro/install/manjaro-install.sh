base_packages="discord flatpak neovim"
uninstall_packages=" "

# Upgrade all
sudo pacman -Syyu

# Install official packages
sudo pacman -S --noconfirm base_packages

# Gnome settings
# gsettings set org.gnome.desktop.interface clock-show-date true
# gsettings set org.gnome.shell enabled-extensions 'elementary'
# gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
# gsettings set org.gnome.Terminal.Legacy.Settings dark-theme true
# gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode 'tab'
# gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
# gsettings set org.gnome.Terminal.Legacy.Keybindings prev-tab '<Alt>Left'
# gsettings set org.gnome.Terminal.Legacy.Keybindings next-tab '<Alt>Right'
# gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/gnome/Mirror.jpg'
# gsettings set org.gnome.desktop.datetime automatic-timezone true
