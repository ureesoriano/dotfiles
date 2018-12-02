#!/bin/bash

sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions

# Numix theme
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-gtk-theme numix-icon-theme-circle
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"

# Minimize windows when clicking its icon in the launcher
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

