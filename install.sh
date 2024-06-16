dir=~/dotfiles
config_files=~/.config

cp -R $dir/nvim $config_files
ln -sF $dir/.p10k.zsh ~/
ln -sF $dir/.zshrc ~/
