#!/bin/bash
# terminal.sh

# gset string background_color #56E0D3



# BACKGROUND_COLOR=$(gnome_color $BACKGROUND_COLOR)

# b1dcc9dd-5262-4d8d-a863-c897e6d979b9

# gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ background-color '#FFFFFF'

# https://wiki.gnome.org/Apps/Terminal/FAQ#How_can_I_change_a_profile_setting_from_the_command_line.3F
# https://git.gnome.org/browse/gnome-terminal/tree/src/org.gnome.Terminal.gschema.xml
# http://mayccoll.github.io/Gogh/#0
# https://github.com/chriskempson/base16-gnome-terminal
# https://unix.stackexchange.com/questions/296699/how-to-export-import-ubuntu-16-04-terminal-color-scheme/296768

UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ visible-name 'One Dark'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-theme-background false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-transparent-background false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ font 'Hack 12'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ background-color '#282c34'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ foreground-color '#abb2bf'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ bold-color '#abb2bf'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ palette ['#000000', '#E06C75', '#98c379', '#d19a66', '#61aeee', '#c678dd', '#56b6c2', '#abb2bf', '#5c6370', '#e06c75', '#98c379', '#d19a66', '#62afee', '#c678dd', '#56b6c2', '#ffffff']
