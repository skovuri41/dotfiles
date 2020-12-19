#!/bin/bash

if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

echo "(+) Downloading Greenclip"
wget https://github.com/erebe/greenclip/releases/download/3.3/greenclip -o $PROJECT_TEMP_PATH/
cd $PROJECT_TEMP_PATH
stow greenclip
