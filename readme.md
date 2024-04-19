# install from live usb

Open UEFI or BIOS (f2)
Remove secure boot policy if enabled
Boot on usb live

Follow https://wiki.archlinux.org/title/Installation_guide(Fran%C3%A7ais) along

In short :
to setup partition,
`fdisk /dev/sda`
then,
create a new partitioning
`g`

create the EFI/Boot partition
`n`
and use

- `1` for partition number
- `default` for first sector
- `+1G` for last sector
  `t` to change the type
  type in `EFI System`

create the swap partition
`n`
and use

- `default`
- `default`
- `+4G`
  `t` and choose part 2
  type in `Linux swap`

create the root partition
`n`
and use

- `default`
- `default`
- `default`

Save change with `w`

follow instructions until chroot into the system

create hostname `/etc/hostname`
`<hostname>`

set the root password
`passwd`

install iwd for wifi
`pacman -S iwd`

install vim
`pacman -S vim`

setup GRUB, https://wiki.archlinux.org/title/GRUB
`pacman -S grub efibootmgr`
`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
and microcode,
`pacman -S intel-ucode`
`grub-mkconfig -o /boot/grub/grub.cfg`

## setup network

start systemd-networkd and systemd-resolved now and on startup,
`systemctl enable --now systemd-networkd.service`
`systemctl enable --now systemd-resolved.service`

### wifi

start iwd now and on startup,
`systemctl enable --now iwd.service`

configure connections
edit or create `/etc/iwd/mainconf`
add

```
[General]
EnableNetworkConfiguration=true
```

connect,
`iwctl`
`station wlan0 connect <ssid>`

### ethernet

`pacman -S dhcpcd`
`systemctl enable dhcpcd@<interface>`
to get interface, e.g. `eno1`
`ip link`

quit chroot
`exit`
reboot and start building your environment
`reboot`

# setup environment

## create user

`useradd -m pierre`
`passwd pierre`

## install sudo

`pacman -S sudo`
add user to sudoers
`export EDITOR=vim`
`visudo`
and add line
`<user_name> <host_name>=(ALL:ALL) ALL`

exit and login with non-root user

## allow ssh connection

`sudo pacman -S openssh`
`sudo systemctl enable --now sshd.service`

## install polkit

`sudo pacman -S polkit`

## install wayland

Follow https://www.fosskers.ca/en/blog/wayland
`sudo pacman -S sway alacritty waybar otf-font-awesome wofi xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland`
exit and login as root
`sway`

## firefox

`sudo pacman -S firefox`

## install git

`sudo pacman -S git`

configure,
`sudo pacman -S openssh`
`ssh-keygen -t ed25519 -C "<email>"`
`eval "$(ssh-agent -s)"`
`ssh-add $HOME/.ssh/id_ed25519`

`cat ~/.ssh/id_ed25519.pub`

## base-devel for AUR packages

`sudo pacman -S base-devel`

## Yay to manage aur packages

`git clone https://aur.archlinux.org/yay-bin.git`
`cd yay-bin`
`makepkg -si`

to update,
`yay -Sua`

to print stats,
`yay -Ps`

to clean unnecessary packages,
`yay -Sc`

## swayfx

`yay swayfx`
reboot

## install zsh

`sudo pacman -S zsh`

make it default shell
`chsh -s /usr/bin/zsh`

first time you log in it will help you configure stuffs
if you want to run it again:
`autoload -Uz zsh-newuser-install`
`zsh-newuser-install -f`

oh my zsh!
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## configure dotfiles

Follow https://www.atlassian.com/git/tutorials/dotfiles

to create,
`git init --bare $HOME/.dotfiles`

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
and add it to `.zshrc`

`dotfiles config --local status.showUntrackedFiles no`

`echo ".dotfiles" >> .gitignore`

to retrieve,
`git clone --bare <git-repo-url> $HOME/.dotfiles`
`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
`dotfiles checkout`
`dotfiles config --local status.showUntrackedFiles no`

## auto prompt username, only ask for password

create & edit `/etc/systemd/system/getty@tty1.service.d/skip-username.conf`

```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -- <username>' --noclear --skip-login - $TERM
```

## OR autologin

create & edit `/etc/systemd/system/getty@tty1.service.d/autologin.conf`

```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin <username> %I $TERM
```

## keepass menu

`yay keepmenu-git`
add `export PATH="$HOME/.local/bin:$PATH"` to `.zshenv`

```
echo "KERNEL==\"uinput\", GROUP=\"users\", MODE=\"0660\", \
  OPTIONS+=\"static_node=uinput\"" | sudo tee \
  /etc/udev/rules.d/80-uinput.rules > /dev/null
```

create & edit `~/.config/systemd/user/ydotoold.service`,

```
  [Unit]
  Description=ydotoold Service

  [Service]
  ExecStart=/usr/bin/ydotoold

  [Install]
  WantedBy=default.target
```

`systemctl --user daemon-reload`
`systemctl --user enable --now ydotoold.service`

## sway config

```
input * {
  repeat_delay 190
  repeat_rate 50
  xkb_layout "us"
  xkb_variant "intl"
}

```

## audio

`sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth`
`yay pacmixer`
reboot

## bluetooth

`sudo pacman -S bluez bluez-utils`
`systemctl enable --now bluetooth.service`

to connect to devices,
`bluetoothctl`
`scan on/off`
`devices`
`pair <adress>`
`connect <adress>`

## vscode

`sudo pacman -S code`

## spotify

`sudo pacman -S spotify-launcher`
