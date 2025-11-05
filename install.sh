dir=~/dotfiles
config_files=~/.config

cp -Rs $dir/nvim $config_files
cp -Rs $dir/aerospace $config_files
ln -sF $dir/.zshrc ~/
ln -sF $dir/.tmux.conf ~/
