sudo pacman -Syyu
sudo pacman -S git openssh tmux vi ttf-jetbrains-mono-nerd
sudo pacman -S iwd networkmanager
sudo pacman -S fzf zoxide starship zsh
sudo pacman -S tmux
sudo pacman -S neovim wl-clipboard
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd
rm -rf paru
sudo pacman -S alacritty
sudo pacman -S qtile python-pywlroots brightnessctl alsa-utils vulkan-intel intel-media-driver kanshi
sudo pacman -S greetd-tuigreet
paru -S pfetch-rs
paru -S zen-browser
sudo pacman -S pipewire pipewire-alsa sof-firmware
sudo pacman -S xdg-desktop-portal-gtk
sudo pacman -S mako
sudo pacman -S fuzzel
paru wlogout

##################################################################################3

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
mkdir ~/.config
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/tmux ~/.config/tmux
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/paru ~/.config/paru
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/qtile ~/.config/qtile
ln -sf ~/.dotfiles/kanshi ~/.config/kanshi
sudo systemctl enable greetd.service
ln -sf ~/.dotfiles/gtk-3.0 ~/.config/gtk-3.0
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
ln -sf ~/.dotfiles/mako ~/.config/mako
ln -sf ~/.dotfiles/fuzzel ~/.config/fuzzel
ln -sf ~/.dotfiles/wlogout ~/.config/wlogout
