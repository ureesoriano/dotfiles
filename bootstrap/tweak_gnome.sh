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

# Install dash to dock gnome extension
wget https://extensions.gnome.org/review/download/8355.shell-extension.zip
unzip ./8355.shell-extension.zip\
    -d ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/

# Minimize windows when clicking its icon in the Dash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Dash max icon size: 42px
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 42
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true

# Applications active on Dash only in the workspace they are on
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true

# Shrink Dash
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

# Window counter indicators -> dashes
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
