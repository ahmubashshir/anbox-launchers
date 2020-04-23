# Anbox Launchers

This project provides a systemd timer and a service to update `.desktop` files created by Anbox and add them to _Anbox_ category in Menu.

## Build Instruction.

### Arch or Arch based distros.

You can install this software from aur.<br />
* `yay -Syu anbox-launchers-git`
* `pikaur -Syu anbox-launchers-git`
* `trizen -Syu anbox-launchers-git`

or build and install from source:
```sh
git clone https://github.com/ahmubashshir/anbox-launchers
git checkout pkgbuild
makepkg -si
```

## Other distros.

You guys have to install from source.
```sh
git clone https://github.com/ahmubashshir/anbox-launchers
sudo make install prefix=/usr
```
