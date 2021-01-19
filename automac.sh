#!/bin/bash

set -x
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## brew
echo "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" > tmp-brew.sh
chmod +x tmp-brew.sh
./tmp-brew.sh

## zsh related tools
brew install zsh
source ~/.zshrc
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo 'plugins=( git zsh-autosuggestions zsh-syntax-highlighting )' >> ~/.zshrc 

## kubernetes related tools
brew install kubectx
brew install kube-ps1
echo 'source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"' >> ~/.zshrc
echo 'PS1="$(kube_ps1)"$PS1' >> ~/.zshrc 


## basic macos apps
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask flycut
brew install --cask docker
brew install --cask istat-menus
brew install --cask spotify
brew install --cask google-chrome
brew install --cask zoomus
brew install --cask microsoft-teams
brew install --cask slack

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Add Visual Studio Code command line
echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zshrc

## Install Golang
curl -L https://git.io/vQhTU | bash

## install lpass cli
brew install lastpass-cli

## install git-duet
brew install git-duet/tap/git-duet
cp ./.git-authors ~/.git-authors

echo ""
echo "Disabling OS X Gate Keeper"
echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable

echo ""
echo "Disabling the 'Are you sure you want to open this application from the Internet?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo ""
echo "Enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 1
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

echo ""
echo "Showing hidden files by default"
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder AppleShowAllFiles TRUE

echo ""
echo "Showing all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Wipe all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array; killall Dock

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
defaults write com.apple.dock persistent-others -array-add "<dict><key>tile-data</key><dict><key>label</key><string>Calendar</string><key>url</key><dict><key>_CFURLString</key><string>https://outlook.office365.com/calendar/view</string><key>_CFURLStringType</key><integer>15</integer></dict></dict><key>tile-type</key><string>url-tile</string></dict>"; killall Dock
defaults write com.apple.dock persistent-others -array-add "<dict><key>tile-data</key><dict><key>label</key><string>Mail</string><key>url</key><dict><key>_CFURLString</key><string>https://outlook.office365.com/mail/inbox</string><key>_CFURLStringType</key><integer>15</integer></dict></dict><key>tile-type</key><string>url-tile</string></dict>"; killall Dock
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"; killall SystemUIServer
defaults write com.generalarcade.flycut bezelAlpha "<real>0.10000000000000001</real>"
defaults write com.generalarcade.flycut bezelHeight "<real>200</real>"
defaults write com.generalarcade.flycut bezelWidth "<real>200</real>"
defaults write com.generalarcade.flycut loadOnStartup "<true/>"
defaults write com.generalarcade.flycut menuIcon "<integer>3</integer>"
defaults write com.generalarcade.flycut rememberNum "<real>99</real>"
defaults write com.generalarcade.flycut removeDuplicates "<true/>"
defaults write com.generalarcade.flycut skipPasswordFields "<false/>"
defaults write com.generalarcade.flycut wraparoundBezel "<true/>"
defaults write com.generalarcade.flycut stickyBezel "<false/>"
