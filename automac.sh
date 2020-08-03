#!/bin/bash

## brew
$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)

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
brew cask install iterm2
brew cask install slack
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install zoomus
brew cask install microsoft-teams

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install Golang
curl -L https://git.io/vQhTU | bash