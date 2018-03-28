#!/usr/bin/env bash

# mkdir -p ~/.vim/undo/ ~/.vim/spell ~/.vim/autoload

# if [ ! -f ~/.vim/autoload/plug.vim ]; then
    # curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fi

# # TODO: conditionally use vim/nvim depending on which is installed
# vim +"PlugSnapshot! $HOME/.vim/revert.sh" +PlugUpgrade +PlugClean! +PlugUpdate +qa

# Keep these dirs in sync with modules/default/plugins.vim
PLUGIN_DIR=~/.vim/dein_plugins
INSTALL_DIR="${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim"

if [ ! -e "$INSTALL_DIR" ]; then
  echo "Begin fetching dein..."
  mkdir -p "$PLUGIN_DIR"
  git clone https://github.com/Shougo/dein.vim "$INSTALL_DIR"
  echo "Done."
  echo ""
fi

vim +'call dein#update()' +qall
