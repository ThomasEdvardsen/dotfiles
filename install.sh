#!/bin/bash

set -e  # Avslutt straks ved feil

# Farger for tydelig tilbakemelding
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starter installasjon...${NC}"

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo -e "${YELLOW}Installerer Homebrew...${NC}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo -e "${GREEN}Homebrew er allerede installert.${NC}"
fi

# --- GNU Stow ---
if ! command -v stow &>/dev/null; then
  echo -e "${YELLOW}Installerer Stow...${NC}"
  brew install stow
else
  echo -e "${GREEN}Stow er allerede installert.${NC}"
fi

# --- Oh My Zsh ---
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo -e "${YELLOW}Installerer Oh My Zsh...${NC}"
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo -e "${GREEN}Oh My Zsh er allerede installert.${NC}"
fi

# --- Installer Powerlevel10k ---
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo -e "${YELLOW}Installerer Powerlevel10k-tema...${NC}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo -e "${GREEN}Powerlevel10k er allerede installert.${NC}"
fi

# --- Backup og fjerning av eksisterende .zshrc ---
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo -e "${YELLOW}Fjerner eksisterende .zshrc (backup lagres)...${NC}"
  mv ~/.zshrc ~/.zshrc.backup.$(date +%s)
fi

# --- Symlinks via stow ---
echo -e "${YELLOW}Oppretter symlinks med Stow...${NC}"
stow zsh
stow git

# --- Brewfile ---
echo -e "${YELLOW}Installerer Homebrew-pakker fra Brewfile...${NC}"
brew bundle --file=Brewfile

echo -e "${GREEN}Ferdig! Åpne et nytt terminalvindu for å bruke Zsh-oppsettet.${NC}"
