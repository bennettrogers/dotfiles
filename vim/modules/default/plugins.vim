" Die early if this Vim install is built with tiny or small.
" We don't want a Raspberry Pi, for example, running all of these.
" if !1 | finish | endif

" " Initialise vim-plug
" call plug#begin()

" " Load plugin list for vim-plug to manage.
" execute 'source' Dot('plugins.vim')

" " Lock in the plugin list.
" call plug#end()

" " Load all plugin configuration files.
" for file in glob(Dot('modules/plugins/*.vim'), 0, 1)
  " exec 'source' file
" endfor

" Initialize dein plugin manager

let DEIN_PLUGIN_DIR = expand('~/.vim/dein_plugins')
let DEIN_INSTALL_DIR = expand('~/.vim/dein_plugins/repos/github.com/Shougo/dein.vim')
let g:dein#cache_directory = g:DEIN_CACHE_DIR
execute "set runtimepath+=".DEIN_INSTALL_DIR

" NOTE: not using the dein cache. If this is too slow, consider
" adding calls to dein#load_state and dein#save_state
" (and use different state/cache files for different environments)

" Required:
call dein#begin(DEIN_PLUGIN_DIR)

" Let dein manage dein
" Required:
call dein#add(DEIN_INSTALL_DIR)

" Add or remove your plugins here:
execute 'source' Dot('dein_plugins.vim')

" Required:
call dein#end()

" Required (might be set elsewhere in vimrc as well...)
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Load all plugin configuration files.
for file in glob(Dot('modules/plugins/*.vim'), 0, 1)
  exec 'source' file
endfor

" End dein scripts-------------------------
