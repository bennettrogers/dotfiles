" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

" Basic config
Plug 'tpope/vim-sensible'                               " good starting point for vimrc

" Behavioral improvements
Plug 'haya14busa/incsearch.vim'                         " highlight all incremental search matches
Plug 'haya14busa/vim-asterisk'                          " better * operation handling
Plug 'rking/ag.vim'                                     " use silver searcher for searching
Plug 'sjl/gundo.vim'                                    " graphical undo tree
Plug 'tpope/vim-surround'                               " smart surrounding (parens, quotes, etc)
Plug 'tpope/vim-sleuth'                                 " tries to match indent settings with what already exists in file

 " Window / UI
Plug 'vim-ctrlspace/vim-ctrlspace'                      " Tab and buffer manager
Plug 'tpope/vim-vinegar'                                " project browser in split window
Plug 'mhinz/vim-signify'                                " gitgutter replacement
Plug 'junegunn/goyo.vim'                                " distraction-free writing
Plug 'terryma/vim-multiple-cursors'                     " sublime-style multiple cursors
Plug 'Lokaltog/vim-easymotion'                          " easy moving within a file

" Styling
Plug 'altercation/vim-colors-solarized'                 " Solarized theme
Plug 'vim-airline/vim-airline'                          " Statusline customization utility
Plug 'vim-airline/vim-airline-themes'                   " Color themes for airline
Plug 'nathanaelkane/vim-indent-guides'                  " displays indent levels

" Language and syntax support
Plug 'scrooloose/syntastic'                             " automatic syntax checking (e.g. JSHint linting)
Plug 'mattn/emmet-vim'                                  " web development multitool
Plug 'mattn/webapi-vim'                                 " api for emmet that enables custom snippets
Plug 'sheerun/vim-polyglot'| Plug 'othree/html5.vim'    " HTML5 syntax and completion
Plug 'marijnh/tern_for_vim', { 'do': 'npm install'  }   " javascript completion
Plug 'pangloss/vim-javascript'                          " javascript friendliness
Plug 'Keithbsmiley/tmux.vim'                            " tmux conf syntax highlighting
Plug 'elzr/vim-json'                                    " JSON support
Plug 'rodjek/vim-puppet'                                " makes vim puppet-friendly
Plug 'reedes/vim-pencil'                                " makes writing text (e.g. markdown) in vim easier
Plug 'luochen1990/rainbow'                              " rainbow parentheses
Plug 'Raimondi/delimitMate'                             " Auto-closing parens and quotes
Plug 'junegunn/vim-easy-align'                          " align text
Plug 'tpope/vim-commentary'                             " easy commenting
Plug 'majutsushi/tagbar'                                " shows the current symbols from this file
Plug 'rizzatti/dash.vim'                                " Dash integration for OSX

" External command helpers
Plug 'tpope/vim-eunuch'                                 " syntactic sugar for some unix commands (e.g. sudo write)
Plug 'tpope/vim-fugitive'                               " git helpers
