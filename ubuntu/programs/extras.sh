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


git clone https://github.com/hackerb9/lsix.git
cd lsix

# just
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin


#b3sum blake3
cd $PROJECT_TEMP_PATH
mkdir blake3
wget https://github.com/BLAKE3-team/BLAKE3/releases/download/0.3.7/b3sum_linux_x64_bin  -O blake/b3sum
stow blake -t /usr/local/bin

#install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

#install wine
# sudo dpkg --add-architecture i386
# wget -nc https://dl.winehq.org/wine-builds/winehq.key
# sudo apt-key add winehq.key
# sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
# sudo apt update
# sudo apt install --install-recommends winehq-stable

# install Lutris ubuntu gaming client
# sudo add-apt-repository ppa:lutris-team/lutris
# sudo apt update
# sudo apt install lutris

#install vivaldi browser
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list
sudo apt update && sudo apt install vivaldi-stable
