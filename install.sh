#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "Installing $DIR..."


# .bashrc install
myrc="
# Dotfile install
export DOTFILE_DIR=$DIR
source \$DOTFILE_DIR/.myrc
# END Dotfile install
"
echo "$myrc" >> ~/.bashrc
echo "$myrc" >> ~/.zshrc

# .vimrc install
echo "
\" Dotfile install
:source $DIR/.vimrc
\" END Dotfile install
" >> ~/.vimrc

mkdir -p ~/.vim/colors
theme_file=~/.vim/colors/monokai-bold.vim
if [ -f "$theme_file" ]; then
    echo "Vim theme file existed. Skipping..."
else
    ln -s $DIR/monokai-bold.vim $theme_file
fi

