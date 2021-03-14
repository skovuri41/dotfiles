#!/bin/bash        
curl -O https://download.clojure.org/install/linux-install-1.10.1.754.sh
chmod +x linux-install-1.10.1.754.sh
sudo ./linux-install-1.10.1.754.sh


# install babashka
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
./install --dir ~/.local/bin


# install clj-kondo
curl -sLO https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo
chmod +x install-clj-kondo
./install-clj-kondo --dir ~/.local/bin

# install cljstyle from https://github.com/greglook/cljstyle
