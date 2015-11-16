 " This is the main plugin list, sourced by modules/plugins.vim
 " Configuration goes in the appropriate modules/plugins/*.vim file.
 " So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

Plug 'tpope/vim-sensible'                               " good starting point for vimrc
Plug 'tpope/vim-commentary'                             " easy commenting
Plug 'tpope/vim-eunuch'                                 " syntactic sugar for some unix commands (e.g. sudo write)
Plug 'tpope/vim-fugitive'                               " git helpers
Plug 'tpope/vim-surround'                               " smart surrounding (parens, quotes, etc)
Plug 'tpope/vim-vinegar'                                " project browser in split window
Plug 'tpope/vim-sleuth'                                 " tries to match indent settings with what already exists in file
Plug 'ctrlpvim/ctrlp.vim'                               " fuzzy file search and open
Plug 'FelikZ/ctrlp-py-matcher'                          " faster ctrlp matching using python
Plug 'Lokaltog/vim-easymotion'                          " easy moving within a file
Plug 'Keithbsmiley/tmux.vim'                            " tmux conf syntax highlighting
Plug 'Raimondi/delimitMate'                             " Auto-closing parens and quotes
Plug 'Valloric/YouCompleteMe'                           " autocompletion
Plug 'marijnh/tern_for_vim', { 'do': 'npm install'  }   " javascript completion
Plug 'haya14busa/incsearch.vim'                         " highlight all incremental search matches
Plug 'haya14busa/vim-asterisk'                          " better * operation handling
Plug 'pangloss/vim-javascript'                          " javascript friendliness
Plug 'elzr/vim-json'                                    " JSON support
Plug 'Shutnik/jshint2.vim'                              " jshint support
Plug 'mhinz/vim-signify'                                " gitgutter replacement
Plug 'nathanaelkane/vim-indent-guides'                  " displays indent levels
Plug 'luochen1990/rainbow'                              " rainbow parentheses
Plug 'rking/ag.vim'                                     " use silver searcher for searching
Plug 'scrooloose/syntastic'                             " automatic syntax checking (e.g. JSHint linting)
Plug 'sjl/gundo.vim'                                    " graphical undo tree
Plug 'terryma/vim-multiple-cursors'                     " sublime-style multiple cursors
Plug 'junegunn/goyo.vim'                                " distraction-free writing
Plug 'reedes/vim-pencil'                                " makes writing text (e.g. markdown) in vim easier
Plug 'majutsushi/tagbar'                                " shows the current symbols from this file
Plug 'itchyny/lightline.vim'                            " lightweight statusline
Plug 'rodjek/vim-puppet'                                " makes vim puppet-friendly
Plug 'junegunn/vim-easy-align'                          " align text
Plug 'mattn/emmet-vim'                                  " web development multitool
Plug 'mattn/webapi-vim'                                 " api for emmet that enables custom snippets
Plug 'altercation/vim-colors-solarized'                 " Solarized theme
