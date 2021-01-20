#!/bin/bash        
curl -O https://download.clojure.org/install/linux-install-1.10.1.754.sh
chmod +x linux-install-1.10.1.754.sh
sudo ./linux-install-1.10.1.754.sh


# install babashka
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
./install --dir ~/bin
