## necessities

The following tools were installed as they are essentially necessities at this point:
- git
- openssh
- tmux
- vi
- necessary font (jetbrains)

## less

requried for showing git diffs

## greetd-tuigreet

Begin with the following command to ensure that the login manager is enabled.

```
sudo systemctl enable greetd.service
```

Afterwards, configure greetd to use tuigreet which may be done so by modifying the file `/etc/greetd/config.toml`. Ensure that `command =` is set to

```
command = "tuigreet --cmd 'qtile start -b wayland'"
```

During boot menu, assuming that you are using systemd-boot, press `e` and then place `quiet splash` at the end of the string. For the changes to persist after reboot edit
/boot/loader/entries/arch.conf and add `quiet loglevel=3` at the end of the options line.


## NetworkManager and iwd

Ensure that NetworkManager and iwd is installed; NM offers more features with automatic network switching and network profiles. The backend for NM is iwd, which serves as a Wi-Fi management daemons similar to wpa_supplicant, but iwd is more lightweight, modern and focused on WiFi. I do not have a need for ethernet for this laptop as it has no means for connecting to ethernet.

As stated in the [debian wiki](wiki.debian.org/NetworkManager/iwd), in order to ensure that IWD backend is enabled. Create /etc/NetworkManager/conf.d/iwd.conf with the following content:

```
[device]
wifi.backend=iwd
```

Then run the following command to restart NetworkManager.service (this assumes that wpa_supplicant was already disabled.

```
sudo systemctl restart NetworkManager
```

connecting to a network is as simple as

```
nmcli dev wifi connect <ssid> password <password>
```

## zsh

XDG stands for "X Desktop Group", now known as freedesktop.org, is a org that develops standards and specs for desktop env.s on Linux and other UNIX-like systems.
- $XDG_DATA_HOME is a directory fo user-specific data files; default is $HOME/.local.share

In addition, zsh requires fzf (cli fuzzy finder) and zoxide (for fuzzy cd); starship is used as zsh's prompt.

Aside from that, zsh will do everything itself once the .zshrc file has been placed in the home directory.

Changing the default shell may be done so through `chsh -s /bin/zsh`

## neovim

wl-clipboard must be installed for neovim clipboard. It should otherwise be self-reliant.

Shouldn't need to deal with this anymore, but quitting neovim and vi wouldn't erase the activity's buffer so the vi/neovim's remaining activity would still remain; had toadd a line of code in env var to replace the buffer with previous command.

Mason will require unzip to install clangd.

## tmux

tmux itself should be self reliant as once the folder is place in the proper path, it should work itself out. However, just for this instance, as I think I solved it, I had to git clone tmux tpm (the plugin manager) as it seems to not have been tracked by my repo. I git cloned then remove the .git dir.

Instead after installing tmux, I need to clone the proper repos.

## paru

will have to be installed manually

clone "https://aur.archlinux.org/paru.git

then `makepkg -si`

### pfetch-rs

Installed through paru. fetch but small output and in rust.

### zen-browser

Optimized firefox browser. I don't understand why, but the first zen browser tab rearranges my workspaces. Subsequent new windows won't do the same thing.

## qtile

Ensure that brightnessctl (controlling brightness), alsa-utils (controlling volume) are installed. Also install python-pywlroots so that qtile may be used as a wayland compositor.

In addition, may need to install graphic drivers too:
- vulkan-intel: provides API support for 3D or render intensive apps; the intel Iris Xe graphics on the i5-1240P support vulkan (surprisingly)
- intel-media-driver: provides hardware-acceleration video encoding and decoding; this is necessary for typical laptop usage
- (dont install) libva-intel-driver is for older hardware and may not be applicable for this case


Qtile oddly wouldn't start up correctly. I frankly have no reason why it just suddenly started working after a random reboot; it's possible that it is because I did not install all the tools that qtile uses that I placed in the startup, such as kanshi. But otherwise, I have no idea why it didn't work.

logs ask for xorg-xwayland, python-dbus-next

## pipewire

For audio, pipewire is preferable because it's newer and solves somes issues of pulseaudio. Pipewire auto installs wireplumber so there is no need to worry about that. Will need to also install pipewire-alsa to integrate with qtile.

In addition, sof-firmware may be required. It is required for this laptop.

## gtk3.0

Install xdg-desktop-portal-gtk in order to take interact with gtk apps and also to query gsettings.

## mako

Just need to install and symlink.

## rofi, wofi, yofi?

None of them. Fuzzel. Make sure to symlink it too.

## wlogout

Installed through paru. Be sure to symlink. Honestly this one is still a work in progress because I have yet to implement hibernation.

## virt manager

https://www.makeuseof.com/how-to-install-arch-linux-kvm-configure-virtual-machine/
https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/


Using the first link, I installed all that it asked; but checking the libvirtd.service, I found that it is necessary that I install dmidecode. You will be asked to replace iptables with iptables-nft, which I said yes to. Run the following command.

```
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
```

Afterwards, `vim /etc/libvirt/libvirtd.conf` in order to modify the file such that

```
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```


Add the user to the libvirt group:

```
sudo usermod -aG libvirt $USER
```
Then restart the service

```
systemctl restart libvirtd.service
```


In order to enable NAT (you make check with `sudo virsh net-list --all`):

```
sudo virsh net-start default 
```

and to autostart:

```
sudo virsh net-autostart default
```

to disable add `--disable` at the end.


## pacman

in /etc/pacman.conf
you can enable color and parallel downloads by uncommenting
