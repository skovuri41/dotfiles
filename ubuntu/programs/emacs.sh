#!/bin/bash

if [[ ! $INSTALL_SCRIPT ]]; then
    echo "(!) Error: You must use the installer script."
    # exit
fi

currentver="$(emacs --version)"
requiredver="27.2"
 if [ "$(printf '%s\n'  "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then
        echo "Emacs $requiredver Already Installed - Exiting"
	exit 1
 else
        echo "Installing Emacs"
 fi

echo "(+) Downloading Emacs"

echo "(+) Installing Emacs Dependencies"
UTILS=(
  libxpm-dev
  libjpeg-dev
  libgnutls28-dev
  libgif-dev
  libtiff-dev
  libacl1-dev
  libgtk-3-dev
  libwebkit2gtk-4.0-dev
  librsvg2-dev
  libmagickcore-dev
  libmagick++-dev
  libgpm-dev
  libselinux1-dev
  libm17n-dev
  libotf-dev
  libsystemd-dev
  libjansson-dev
  libncurses-dev
)
for util in "${UTILS[@]}"; do
  sudo apt-get install $util -y
done

echo "proj temp path: "
echo $PROJECT_TEMP_PATH
cd $PROJECT_TEMP_PATH
tar -xf $PROJECT_TEMP_PATH/emacs-27.2.tar.gz
#rm emacs-27.1.tar.xz
cd emacs-27.2

sudo -s <<'EOF'
  ./configure --disable-silent-rules \
--with-modules --with-file-notification=inotify --with-mailutils \
--with-x=yes --with-x-toolkit=gtk3 --with-xwidgets --with-lcms2 \
--with-imagemagick --with-json
  make
  make install prefix=/usr/local/stow/emacs
  cd /usr/local/stow
  stow emacs
EOF


echo "(+) Creating Desktop Entry $HOME_PATH/.local/share/applications/emacs.desktop"

cat > $HOME_PATH/.local/share/applications/emacs.desktop << EOF
[Desktop Entry]
Version=1.0
Name=Emacs
Exec=emacs
Type=Application
Terminal=false
Icon=/usr/local/stow/emacs/share/icons/hicolor/scalable/apps/emacs.svg
Categories=Development;
EOF

cat > $HOME_PATH/.local/share/applications/org-protocol.desktop << EOF
[Desktop Entry]
Name=org-protocol
Exec=emacsclient %u
Type=Application
Terminal=false
Categories=System;
MimeType=x-scheme-handler/org-protocol;
EOF

echo "(+) Complete! Look for Emacs in your application menu."
