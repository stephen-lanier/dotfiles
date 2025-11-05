#!/bin/bash
set -e  # Exit on error

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

# Helper function to create symlinks safely
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if source exists
    if [ ! -e "$source" ]; then
        echo "Warning: Source $source does not exist, skipping..."
        return 1
    fi
    
    # Backup existing file/directory if it exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $(basename "$target") to ${target}.backup"
        mv "$target" "${target}.backup"
    fi
    
    # Remove existing symlink if it exists
    rm -f "$target"
    
    # Create symlink
    ln -s "$source" "$target"
    echo "Created symlink: $target -> $source"
}


# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

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
mkdir -p "$CONFIG_DIR"

# Create symlink for nvim config directory
create_symlink "$SCRIPT_DIR/nvim" "$CONFIG_DIR/nvim"

# Create symlink for aerospace config file
mkdir -p "$CONFIG_DIR/aerospace"
create_symlink "$SCRIPT_DIR/aerospace/aerospace.toml" "$CONFIG_DIR/aerospace/aerospace.toml"

# Create symlinks for dotfiles
for dotfile in .zshrc .tmux.conf; do
    create_symlink "$SCRIPT_DIR/$dotfile" "$HOME/$dotfile"
done

echo "Installation complete!"
