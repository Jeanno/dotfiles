#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Installing $DIR..."


# .bashrc install
myrc="
# Dotfile install
source $DIR/.myrc
# END Dotfile install
"
echo $myrc >> ~/.bashrc
echo $myrc >> ~/.zshrc

# .vimrc install
echo "
\" Dotfile install
:source $DIR/.vimrc
\" END Dotfile install
" >> ~/.vimrc

mkdir -p ~/.vim/colors
ln -s $DIR/monokai-bold.vim ~/.vim/colors/monokai-bold.vim

