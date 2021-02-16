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


echo "(+) Installing trash-cli"
cd $PROJECT_TEMP_PATH
git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
sudo pip install .

sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
git clone --depth 1 https://github.com/jarun/nnn
cd nnn
sudo make O_NERD=1
sudo cp nnn /usr/bin
