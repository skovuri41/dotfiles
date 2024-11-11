#!/bin/bash        
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
chmod +x linux-install.sh
sudo ./linux-install.sh

# install babashka
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
./install --dir ~/.local/bin


# install clj-kondo
curl -sLO https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo
chmod +x install-clj-kondo
./install-clj-kondo --dir ~/.local/bin

# install cljstyle from https://github.com/greglook/cljstyle

#install babashka bbin
mkdir -p ~/.babashka/bbin/bin && curl -o- -L https://raw.githubusercontent.com/babashka/bbin/v0.1.2/bbin > ~/.babashka/bbin/bin/bbin && chmod +x ~/.babashka/bbin/bin/bbin
# echo 'export PATH="$PATH:$HOME/.babashka/bbin/bin"' >> ~/.$(basename $SHELL)rc && exec $SHELL

bash <(curl -s https://raw.githubusercontent.com/borkdude/jet/master/install)
