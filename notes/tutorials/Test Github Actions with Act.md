https://github.com/nektos/act
## Installation

On Arch Linux, from [AUR](https://aur.archlinux.org/packages/act),

```
yay -Syu act
```

The `-Syu` option also "Update package list and upgrade all currently installed repo and **AUR**."

## Usage

Run the command with root privilege, although you could [add yourself to docker group](https://docs.docker.com/engine/install/linux-postinstall/), but it'd be less secure.

```
sudo act push
```

To use your local `.env`,

```
sudo act push --secret-file .env
```


