#!/usr/bin/env bash

mkdir -p ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# TODO: conditionally use vim/nvim depending on which is installed
nvim +"PlugSnapshot! $HOME/.vim/revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa
