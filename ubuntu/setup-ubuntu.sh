#!/bin/bash

export PROJECT_TEMP_PATH=$PWD/tmp

# Flag this as a proper starting point
export INSTALL_SCRIPT=true

# Detect the Home path for root or a user
if [[ $USER == 'root' ]]; then
    export HOME_PATH="/root"          # (No Trailing Slash)
else
    export HOME_PATH="/home/$USER"    # (No Trailing Slash)
fi

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

install curl
install cifs-utils
install build-essential
install dialog
install exfat-utils
install file
install git
install git-extras
install htop
install nmap
install openvpn
install tree
install vim
install wget
install stow
install entr
sudo add-apt-repository ppa:bashtop-monitor/bashtop -y
install bashtop
install fonts-firacode
install sqllite3

sudo add-apt-repository ppa:ultradvorka/ppa -y
install hstr

install figlet
install lolcat

install i3xrocks-weather
install i3xrocks-wifi
install i3xrocks-temp
install i3xrocks-time
install xfce4-terminal
install silversearcher-ag
install ispell
install x11-utils
install xsel
install feh
install openssh-server
apt install gnome-scr

install net-tools
install hunspell
install keepassxc

install tmux
install unzip
install rlwrap
install xclip
install silversearcher-ag
install ripgrep
install fd-find
install mpc
install mpd
install ncmpcpp
install lnav
install scrot
install jq
install gnome-tweak-tool
install ffmpeg
install youtube-dl
install numlockx
#install ranger
install imagemagick
install graphviz
install direnv

install exiv2
install pavucontrol
install p7zip-full
install p7zip-rar
install vlc
sudo apt-get install davfs2 -y


#TODO install starship
#https://github.com/starship/starship

echo "(+) Creating Desktop Entry $HOME_PATH/.local/share/applications/mpd.desktop"

cat > $HOME_PATH/.local/share/applications/mpd.desktop << EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Music Player Daemon
Comment=Server for playing audio files
Exec=mpd
StartupNotify=false
Terminal=false
Hidden=false
EOF
sudo desktop-file-install $HOME_PATH/.local/share/applications/mpd.desktop


echo "Installing Java"
install openjdk-11-jdk
# Notes after installation of jdk
#sudo update-alternatives --config java
#sudo update-alternatives --config javac


# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y

figlet "Setup Completed!" | lolcat
