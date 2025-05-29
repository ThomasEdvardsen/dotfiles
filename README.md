# Thomas Edvardsen's Dotfiles

This is my personal dotfiles repo for setting up a developer environment on macOS using Zsh, Oh My Zsh, Powerlevel10k, Homebrew, and GNU Stow.

## Getting Started

```bash
git clone git@github.com:ThomasEdvardsen/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This script will:
- Install Homebrew and GNU Stow if needed
- Install Oh My Zsh and Powerlevel10k
- Symlink config files using `stow`
- Run `brew bundle` to install tools and apps

## Requirements

- macOS
- Homebrew
- Git
- A terminal that supports Zsh (e.g. Ghostty, iTerm2)

## Tips

- Press `Cmd + Shift + .` in Finder to show hidden files like `.zshrc`
- Run `p10k configure` to customize your prompt after installation
- Put your own aliases and tools in `bin/` and source them from `.zshrc`


