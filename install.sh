#!/bin/bash
dir=~/dotfiles
config_files=~/.config

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file=$dir/Brewfile

# Create config directory if it doesn't exist
mkdir -p $config_files

# Copy config files
cp -Rs $dir/nvim $config_files
cp -Rs $dir/aerospace $config_files
ln -sF $dir/.zshrc ~/
ln -sF $dir/.tmux.conf ~/

echo "Installation complete!"
