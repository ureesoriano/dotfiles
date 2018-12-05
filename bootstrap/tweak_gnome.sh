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
unzip ./8355.shell-extension.zip \
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

# Install Panel OSD (AKA: move notifications) gnome extension
wget https://extensions.gnome.org/extension-data/panel-osd@berend.de.schouwer.gmail.com.v36.shell-extension.zip
unzip ./panel-osd@berend.de.schouwer.gmail.com.v36.shell-extension.zip \
    -d ~/.local/share/gnome-shell/extensions/panel-osd@berend.de.schouwer.gmail.com/
# TODO via gnome tweaks app:
# * Set notifications to top right corner, via gnome tweaks app
# (Panel OSD extension doesn't seem to have a settings scheme)

# Install Hide Top Bar gnome extension
wget https://extensions.gnome.org/extension-data/hidetopbar@mathieu.bidon.ca.v63.shell-extension.zip
unzip ./hidetopbar@mathieu.bidon.ca.v63.shell-extension.zip \
    -d ~/.local/share/gnome-shell/extensions/hidetopbar@mathieu.bidon.ca/
# TODO via gnome tweaks app:
# * 'Show panel when mouse approaches ...' ON
# * 'Keep hot corner sensitive, even ...'  ON
# * 'Pressure barrier's threshold' 30
# * 'Pressure barrier's timeout' 500
# * 'Key that triggers the bar' Pause

# Install Frippery Move Clock gnome extension
wget https://extensions.gnome.org/extension-data/Move_Clock@rmy.pobox.com.v18.shell-extension.zip
unzip ./Move_Clock@rmy.pobox.com.v18.shell-extension.zip \
    -d ~/.local/share/gnome-shell/extensions/Move_Clock@rmy.pobox.com/

# Install OpenWeather gnome extension
wget https://extensions.gnome.org/extension-data/openweather-extension@jenslody.de.v97.shell-extension.zip
unzip ./openweather-extension@jenslody.de.v97.shell-extension.zip \
    -d ~/.local/share/gnome-shell/extensions/openweather-extension@jenslody.de
