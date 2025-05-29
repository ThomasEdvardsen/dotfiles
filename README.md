# Thomas Edvardsen's Dotfiles

This is my personal dotfiles repo for setting up a developer environment on macOS using Zsh, Oh My Zsh, Powerlevel10k, Homebrew, and GNU Stow.

## Getting Started

```bash
git clone git@github.com:ThomasEdvardsen/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This script will:
- Install Homebrew and Stow if needed
- Install Oh My Zsh and Powerlevel10k
- Symlink config files using `stow`
- Run `brew bundle` to install tools and apps

## Homebrew

```bash
#Install and upgrade (by default) all dependencies from the Brewfile
brew bundle [--file=Brewfile]

#Write all installed casks/formulae/images/taps into a Brewfile
brew bundle dump --file=~/dotfiles/Brewfile --force [--describe]
```

## Tips

- Press `Cmd + Shift + .` in Finder to show hidden files like `.zshrc`
- Run `p10k configure` to customize your prompt after installation
- Put your own aliases and tools in `bin/` and source them from `.zshrc`


