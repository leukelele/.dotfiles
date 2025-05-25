## Initial packages install for sway installation
alacritty
base
base-devel
brightnessctl
btop
docker
efibootmgr
fzf
git
greetd-tuigreet
gst-plugin-pipewire
intel-media-driver
intel-ucode
iwd
less
libpulse
linux
linux-firmware
linux-lts
neovim
networkmanager
openssh
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
rofi-wayland
sof-firmware
starship
sway
sway-contrib
swaybg
swayidle
swayimg
swaylock
swaync
tmux
ttf-jetbrains-mono-nerd
ttf-nerd-fonts-symbols
ttf-nerd-fonts-symbols-mono
waybar
wireplumber
wl-clipboard
xorg-xwayland
zathura
zathura-pdf-mupdf
zoxide
zram-generator
zsh

## remove the ACPI msgs
It seems to be a non-issue that I am receiving ACPI error msgs; chat indicates that its due to new systems using different symbols (or something) that is not compatible. Regardless, the messages are annying especially with a TUI login. So I disabled them by going to /boot/loader/entries and editing the .conf files by adding `loglevel=3` at the end of `options`. This probably isn't smart but I have yet to face the consequences of my actions.

## setting up greetd-tui
In the `/etc/greetd` folder, edit the file `config.toml`; and ensure that 
```
command = "tuigreet --cmd sway"
```
Then enable greetd by:
```
sudo systemctl enable greetd.service
```

## set up init sway config
```
chsh -s $(which zsh)
```
Then symlink .zshrc to home directory

## symlink tools for env setup
sf .gitconfig to home
sf alacritty to config
sf nvim to config
sf starship.toml to config
sf tmux to config
sf sway to config
sf zathura to config

## fixing lazy nvim
installed additional things such as unzip and npm

## installed paru
```
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## waybar
just modified and copy whatever from the dot-files to my own

## fix tmux coloring
the reason was bc i need to git clone both the tpm plugin AND the catppuccin repo
## installed luarocks
this is required by nvim i think? a lot of issues seem to arise because luarocks is missing

## fonts
just install nerd-fonts through pacman

## installed rtkit
this seems to be necessary for pipewire cli to change volume

## suppress gdbus message
```
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-wlr
```
this supresses the gdbus message issue

## env var not set for some reason
```bash
#!/bin/bash
export XDG_CURRENT_DESKTOP=sway
exec sway "$@"
```

at boot down there is msg that says XDG_CURRENT_DESKTOP not set so created bash script
and had greetd-tuigreet exec this

## in order to prevent boot up message bleeding over to greetd
```bash
[Service]
ExecStartPre=kill -SIGRTMIN+21 1
ExecStopPost=kill -SIGRTMIN+20 1
```
This is file `/usr/lib/systemd/system/greetd.service.d/00-nobleed.conf`.

## more installed packages:
❯ pacman -Qqe
alacritty
base
base-devel
brightnessctl
btop
discord
docker
efibootmgr
firefox
fzf
git
greetd-tuigreet
gst-plugin-pipewire
intel-media-driver
intel-ucode
iwd
less
libpulse
linux
linux-firmware
linux-lts
luarocks
neovim
networkmanager
npm
opendoas
openssh
paru
paru-debug
pfetch-rs
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
rnote
rofi-wayland
rtkit
sof-firmware
starship
sway-contrib
swaybg
swayfx
swayidle
swayimg
swaylock
swaync
tmux
ttf-jetbrains-mono-nerd
unzip
vi
waybar
wireplumber
wl-clipboard
xdg-desktop-portal
xdg-desktop-portal-gtk
xdg-desktop-portal-wlr
xorg-xwayland
zathura
zathura-pdf-mupdf
zoxide
zram-generator
zsh
## wifi
```bash

[Security]
EAP-Method=PEAP
EAP-Identity=anonymous@uni.edu
EAP-PEAP-Phase2-Method=MSCHAPV2
EAP-PEAP-Phase2-Identity=netid
EAP-PEAP-Phase2-Password=pass

[Settings]
AutoConnect=true
```
