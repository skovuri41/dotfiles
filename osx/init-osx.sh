# Show the ~/Library folder
echo '*** show the ~/Library folder ***'
chflags nohidden ~/Library
# Speed up Mission Control animations
echo '*** speed up mission control animations ***'
defaults write com.apple.dock expose-animation-duration -float 0.2
