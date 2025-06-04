#!/bin/bash
set -e

echo "Dumping Brewfile to temporary file..."
brew bundle dump --file=Brewfile.tmp --force

echo "Removing Brewfile-admin entries from Brewfile..."
grep -vFf Brewfile-admin Brewfile.tmp > Brewfile

rm Brewfile.tmp
echo "Brewfile updated. Brewfile-admin left unchanged."
