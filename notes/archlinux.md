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

to avoid slow startup when not connected to ethernet, (https://wiki.archlinux.org/title/Dhcpcd#dhcpcd@.service_causes_slow_startup)
create and edit `/etc/systemd/system/dhcpcd@.service.d/no-wait.conf`,

```
[Service]
ExecStart=
ExecStart=/usr/bin/dhcpcd -b -q %I
```

# setup environment

## create user

`useradd -m pierre`
`passwd pierre`

## sudo

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

## polkit

`sudo pacman -S polkit`

## wayland

Follow https://www.fosskers.ca/en/blog/wayland
`sudo pacman -S sway alacritty waybar otf-font-awesome wofi xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland`
exit and login as root
`sway`

## or X

https://ejmastnak.com/tutorials/arch/startx/

with `picom` as a compositor
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

## zsh

`sudo pacman -S zsh`

make it default shell
`chsh -s /usr/bin/zsh`

first time you log in it will help you configure stuffs
if you want to run it again:
`autoload -Uz zsh-newuser-install`
`zsh-newuser-install -f`

oh my zsh!
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

`yay autojump`

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

## firefox

`sudo pacman -S firefox`

## keepass menu

`yay keepmenu-git`
`sudo pacman -S wl-clipboard`
add `export PATH="$HOME/.local/bin:$PATH"` to `.zshenv`

## audio

`sudo pacman -S alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth`
reboot

## bluetooth

https://thelinuxcode.com/configure_bluetooth_arch_linux/

`sudo pacman -S bluez bluez-utils`
`systemctl enable --now bluetooth.service`

to connect to devices,
`bluetoothctl`
`scan on/off`
`devices`
`pair <adress>`
`connect <adress>`

to auto connect, like a keyboard,
create & edit `/etc/systemd/system/headphones.service`

```
[Unit]
Description=Connect Bluetooth keyboard

[Service]
ExecStart=/usr/bin/bluetoothctl connect 11:22:33:44:55:66

[Install]
WantedBy=bluetooth.target
```

`sudo systemctl enable --now keyboard.service`

## vscode

`yay visual-studio-code-bin`

## nvjm

`yay nvm`

add to `.zshrc`,
`source /usr/share/nvm/init-nvm.sh`

to auto nvm,

```
#
# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#
enter_directory() {
if [[ $PWD == $PREV_PWD ]]; then
    return
fi

PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
fi
}

export PROMPT_COMMAND="$PROMPT_COMMAND; enter_directory"
```

## pnpm

`sudo pacman -S pnpm`

add to .zshenv,

```
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/pierre/.local/share/pnpm"
case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

```

## postgresql

`sudo pacman -s postgresql`

`sudo su - postgres`
`initdb -D '/var/lib/postgres/data'`
create user,
`createuser --interactive`

exit postgres user
`systemctl enable --now postgresql.service`

create db,
`createdb <dbname>`

## spotify

`sudo pacman -S spotify-launcher`

to use with wayland,
add
```
extra_arguments = ["--enable-features=UseOzonePlatform", "--ozone-platform=wayland"]
```
to `~/.config/spotify-launcher.conf`
## fonts

`yay ttf-google-fonts-git`

## musescore

`sudo pacman -S fuse2`

download musescore appimage to `~/app`

`chmod +x` the appimage

## muse-hub

Download .deb from official site,
from https://github.com/neferin12/muse-sounds-manager-aur/issues/1#issuecomment-2077940987,
`sudo pacman -S dpkg`
`sudo dpkg-deb -xv Muse_Sound_Manager_Beta.deb /`

## obsidian

`sudo pacman -S obsidian`

Looks like there is an issue with electron starting with v.25, so,
[Download](https://archive.archlinux.org/packages/e/electron23/) electron 23,
`sudo pacman -U electron23-23.3.13-9-x86_64.pkg.tar.zst`
and modify `/usr/bin/obsidian` to use `electron23`.

I use the `everforest enchanted` theme.
And enable vim mode !

## phone file transfert

`sudo pacman -S android-file-transfer`
`aft-mtp-mount ~/mnt`

## corrupted packages when updating

if
`sudo pacman -Suy`
results in corrupted packages,
`pacman -S archlinux-keyring`

## translate-shell

`sudo pacman -S translate-shell`

## screen sharing

follow https://www.baeldung.com/linux/share-desktop-screen-via-browser

## keyboard layout and key repeat

xset command, on a ~/.xprofile or so, will be reste to seat defaults whenever a keyboard is plugged back on or is waking up.

To make sure the settings are consistent, create `/etc/X11/xorg.conf.d/00-keyboard.conf` and add:

```
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "us"
    Option "XkbModel" "pc104"
    Option "XkbVariant" "intl"
    Option "XkbOptions" "caps:none"
    Option "AutoRepeat" "190 20"
EndSection
```