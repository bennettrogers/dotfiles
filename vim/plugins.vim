" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

" Basic config
Plug 'tpope/vim-sensible'                               " good starting point for vimrc

" Behavioral improvements
Plug 'haya14busa/incsearch.vim'                         " highlight all incremental search matches
Plug 'haya14busa/vim-asterisk'                          " better * operation handling
Plug 'mileszs/ack.vim'                                  " search tool
Plug 'sjl/gundo.vim'                                    " graphical undo tree
Plug 'tpope/vim-surround'                               " smart surrounding (parens, quotes, etc)
Plug 'tpope/vim-sleuth'                                 " tries to match indent settings with what already exists in file
Plug 'tpope/vim-unimpaired'                             " shortcuts for common paired actions (e.g. next/prev error)

 " Window / UI
Plug 'vim-ctrlspace/vim-ctrlspace'                      " tab and buffer manager
Plug 'tpope/vim-vinegar'                                " project browser in split window
Plug 'mhinz/vim-signify'                                " gitgutter replacement
Plug 'junegunn/goyo.vim'                                " distraction-free writing
Plug 'terryma/vim-multiple-cursors'                     " sublime-style multiple cursors
Plug 'Lokaltog/vim-easymotion'                          " easy moving within a file

" Styling
Plug 'altercation/vim-colors-solarized'                 " solarized theme
Plug 'vim-airline/vim-airline'                          " statusline customization utility
Plug 'vim-airline/vim-airline-themes'                   " color themes for airline
Plug 'edkolev/tmuxline.vim'                             " tmux statusline generator with support for patched fonts
Plug 'nathanaelkane/vim-indent-guides'                  " displays indent levels

" Language and syntax support
Plug 'neomake/neomake'                                  " automatic syntax checking (e.g. JSHint linting)
Plug 'mattn/emmet-vim'                                  " web development multitool
Plug 'mattn/webapi-vim'                                 " api for emmet that enables custom snippets
Plug 'marijnh/tern_for_vim', { 'do': 'npm install'  }   " javascript completion
Plug 'pangloss/vim-javascript'                          " javascript friendliness
Plug 'Keithbsmiley/tmux.vim'                            " tmux conf syntax highlighting
Plug 'elzr/vim-json'                                    " jSON support
Plug 'rodjek/vim-puppet'                                " makes vim puppet-friendly
Plug 'reedes/vim-pencil'                                " makes writing text (e.g. markdown) in vim easier
Plug 'luochen1990/rainbow'                              " rainbow parentheses
Plug 'Raimondi/delimitMate'                             " auto-closing parens and quotes
Plug 'junegunn/vim-easy-align'                          " align text
Plug 'tpope/vim-commentary'                             " easy commenting
Plug 'majutsushi/tagbar'                                " shows the current symbols from this file
Plug 'rizzatti/dash.vim'                                " dash integration for OSX

" External command helpers
Plug 'tpope/vim-eunuch'                                 " syntactic sugar for some unix commands (e.g. sudo write)
Plug 'tpope/vim-fugitive'                               " git helpers
