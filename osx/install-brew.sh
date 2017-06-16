# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew tap caskroom/cask
brew install brew-cask

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
brew tap homebrew/completions 
brew inst all tmux
brew install cask

#java
brew cask install java
#brew install Caskroom/cask/java

# Useful OS X softwares.
brew cask install bettertouchtool  # A tool for adding shortcuts to apps.
# Use long press cmd button on any mac app to see shortcuts.
brew cask install cheatsheet
# Offline documentation browser
brew cask install dash
brew cask install google-chrome
brew cask install iterm2
brew cask install kindle  # Kindle reader for Mac.
brew cask install quicksilver # Quicksilver is better than Spotlight.
brew cask install zipeg  # A zip file reader for Mac.
brew install ant  # For building android projects.
# Install `wget` with IRI support.
brew install wget --with-iri
# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh


# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install webkit2png

# Install VM
brew cask install vagrant
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant-manager

brew install hunspell
brew install the_silver_searcher

brew install --HEAD ctags

# brew install gnupg
brew install gpg2
brew install pinentry-mac

# mu4e
brew install mu
brew install python
brew install offline-imap

brew install hh

#Docker
brew cask install dockertoolbox

#fira code
brew cask install font-fira-code

brew install rlwrap
brew install trash

#emacs mac port

#$ brew tap railwaycat/emacsmacport
#and then
#$ brew install emacs-mac
#if you using cask
#brew cask install emacs-mac
#To disable this tap, please:
#$ brew untap railwaycat/emacsmacport

brew install node

# emacs pdf viewer
brew install poppler

brew install koekeishiya/kwm/kwm
brew install koekeishiya/khd/khd

brew install boot-clj
brew install graphviz

# Remove outdated versions from the cellar.
brew cleanup
