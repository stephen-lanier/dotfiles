# dotfiles

Personal macOS configuration files.

## Installation

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## What's included

- **Neovim** - LSP, Telescope, Treesitter, auto-completion
- **Zsh** - oh-my-zsh with Pure prompt, vi-mode, modern CLI tools
- **Tmux** - vim-style navigation, minimal theme
- **AeroSpace** - i3-like tiling window manager
- **Brewfile** - all packages and applications

## Post-install

Set zsh as default shell: `chsh -s $(which zsh)`
