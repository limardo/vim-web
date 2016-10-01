#!/bin/sh
#
# Vim installer by Luca Limardo <luca.limardo@gmail.com>
# Licensed under Apache License 2.0

MYBASEDIR=$(printf "%q\n" "$(pwd)")
MYVIM=$MYBASEDIR/.vimrc
MYGVIM=$MYBASEDIR/.gvimrc
HOME=$(printf "%q\n" "$(eval echo '~')")

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Link .vimrc
eval "ln -s $MYVIM $HOME/.vimrc"

# Link .gvimrc
eval "ln -s $MYGVIM $HOME/.gvimrc"

# Install Plugins
vim +PluginInstall +qall