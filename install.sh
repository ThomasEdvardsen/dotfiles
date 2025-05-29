#!/bin/bash

# Installer Homebrew hvis det ikke er installert
if ! command -v brew &>/dev/null; then
  echo "Installerer Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Installer GNU Stow hvis det ikke er installert
if ! command -v stow &>/dev/null; then
  echo "Installerer GNU Stow..."
  brew install stow
fi

# Installer Oh My Zsh hvis det ikke er installert
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installerer Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Installer Homebrew-pakker fra Brewfile
echo "Installerer Homebrew-pakker..."
brew bundle --file=Brewfile

# Bruk Stow til å lage symlinks for konfigurasjonsfiler
echo "Oppretter symlinks med Stow..."
stow zsh
stow git
