#!/bin/bash

if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Greenclip"

cd $PROJECT_TEMP_PATH
mkdir greenclip
wget https://github.com/erebe/greenclip/releases/download/3.3/greenclip -P greenclip/
stow greenclip -t /usr/local/bin


# echo "(+) Installing Jetbrains Font"
# wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip
# unzip JetBrainsMono-1.0.0.zip
# sudo mv JetBrainsMono-*.ttf /usr/share/fonts/
