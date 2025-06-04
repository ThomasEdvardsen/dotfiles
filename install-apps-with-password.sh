#!/bin/bash

# Stop execution if errors occurs
set -e

# Set colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Installing Homebrew-packages from Brewfile-admin...${NC}"
brew bundle --file=Brewfile-admin

echo -e "${GREEN}Done! Apps installed.${NC}"
