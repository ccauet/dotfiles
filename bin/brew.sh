#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# add taps
brew tap caskroom/cask
brew tap caskroom/versions

# update everything
brew update && brew upgrade && brew cleanup && brew prune

# Install useful stuff 
binaries=(
  ack
  git
  imagemagick --with-webp
  lua
  p7zip
  pigz
  pv
  rename
  tree
  zopfli
  zsh
  tmux
  duplicity
  s3cmd
)

echo "installing binaries..."
brew install ${binaries[@]}
brew cleanup

# install homebrew-cask
brew install caskroom/cask/brew-cask

# Make sure everything is up-to-date
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

apps=(
  xquartz
  dropbox
  alfred
  openoffice
  caffeine
  iterm2
  skim
  vlc
  latexit
  forklift
  skype
  bittorrent-sync
  # Quick Look plugins
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlprettypatch
  quicklook-csv
  betterzipql
  webp-quicklook
  suspicious-package
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link # modify Alfreds scope to include homebrew casl apps
