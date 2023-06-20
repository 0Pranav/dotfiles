# Dotfiles
Backup of `emacs`, `zsh`, `rclone` dotfiles.
Use [stow](https://www.gnu.org/software/stow/) to place the files in the correct directories.
Instructions for individual programs can be found below.

## Emacs
1. Install [emacs](https://www.gnu.org/software/emacs/)
2. Install [doom](https://github.com/doomemacs/doomemacs)
3. Stow the emacs files
4. Run `doom sync`

## zsh

1. Install zsh and change Shell
2. Stow the `zsh` files

## rclone

1. Install rclone
2. Create a provider for your cloud provider
3. Modify the service file according the the provider you just created (e.g. change provider name, change arguments if required)
4. Stow the `rclone` files

## Restart WiFi 

1. Stow the `wifi` files

This is just a shell script that restarts the WiFi using the system bus.
