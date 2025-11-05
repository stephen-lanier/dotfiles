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

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins for oh-my-zsh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Create config directory if it doesn't exist
mkdir -p $config_files

# Create symlinks for config files (backup existing files if they exist)
for config in nvim aerospace; do
    if [ -e "$config_files/$config" ] && [ ! -L "$config_files/$config" ]; then
        echo "Backing up existing $config to $config_files/$config.backup"
        mv "$config_files/$config" "$config_files/$config.backup"
    fi
    ln -sf "$dir/$config" "$config_files/$config"
done

# Create symlinks for dotfiles (backup existing files if they exist)
for dotfile in .zshrc .tmux.conf; do
    if [ -e "$HOME/$dotfile" ] && [ ! -L "$HOME/$dotfile" ]; then
        echo "Backing up existing $dotfile to $HOME/$dotfile.backup"
        mv "$HOME/$dotfile" "$HOME/$dotfile.backup"
    fi
    ln -sf "$dir/$dotfile" "$HOME/$dotfile"
done

echo "Installation complete!"
