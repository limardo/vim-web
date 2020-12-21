#!/bin/sh
#
# Vim installer by Luca Limardo <luca.limardo@gmail.com>
# Licensed under Apache License 2.0

MYBASEDIR=$(printf "%q\n" "$(pwd)")
MYVIM=$MYBASEDIR/.vimrc
MYGVIM=$MYBASEDIR/.gvimrc
HOME=$(printf "%q\n" "$(eval echo '~')")
SYSTEM="$(uname -s)"

# Install dein.vim
git clone --depth=1 https://github.com/Shougo/dein.vim $HOME/.vim/bundles/dein.vim

# Link .vimrc
eval "ln -s $MYVIM $HOME/.vimrc"

# Link .gvimrc
eval "ln -s $MYGVIM $HOME/.gvimrc"

# Download fonts
mkdir -p $HOME/.local/share/fonts
curl -fL https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip -o $HOME/.local/share/fonts/DejaVuSansMono.zip
unzip $HOME/.local/share/fonts/DejaVuSansMono.zip -d $HOME/.local/share/fonts/
rm -rf $HOME/.local/share/fonts/DejaVuSansMono.zip


if [ $SYSTEM == "Darwin" ]; then
  cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
fi

# Install Plugins
IDE=1 vim "+call dein#install()" +qall
