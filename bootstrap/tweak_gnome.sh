#!/bin/bash

sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions

# Minimize windows when clicking its icon in the launcher
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

