#!/bin/bash

if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    exit
fi

sudo add-apt-repository ppa:regolith-linux/release
install regolith-desktop-standard
