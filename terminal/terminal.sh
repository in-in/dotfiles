#!/bin/bash
# terminal.sh

# https://wiki.gnome.org/Apps/Terminal/FAQ#How_can_I_change_a_profile_setting_from_the_command_line.3F
# https://git.gnome.org/browse/gnome-terminal/tree/src/org.gnome.Terminal.gschema.xml
# http://ethanschoonover.com/solarized
# https://github.com/chriskempson/base16-gnome-terminal/blob/master/base16-solarized.dark.sh

UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ visible-name 'Solarized Dark'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ default-size-columns '100'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ default-size-rows '28'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-transparent-background false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font 'Hack 12'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ background-color '#002b36'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ foreground-color '#93a1a1'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ bold-color '#93a1a1'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ palette ['#002b36', '#dc322f', '#859900', '#b58900', '#268bd2', '#6c71c4', '#2aa198', '#93a1a1', '#657b83', '#dc322f', '#859900', '#b58900', '#268bd2', '#6c71c4', '#2aa198', '#fdf6e3']
