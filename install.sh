#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Installing $DIR..."


# .bashrc install
echo "
# Dotfile install
source $DIR/.bashrc
# END Dotfile install
" >> ~/.bashrc

# .vimrc install
echo "
\" Dotfile install
:source $DIR/.vimrc
\" END Dotfile install
" >> ~/.vimrc

mkdir -p ~/.vim/colors
ln -s $DIR/monokai-bold.vim ~/.vim/colors/monokai-bold.vim

