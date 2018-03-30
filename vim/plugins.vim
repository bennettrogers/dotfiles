" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

" Basic config
if g:terminal_env
    Plug 'tpope/vim-sensible'                                           " good starting point for vimrc
endif

" Behavioral improvements
Plug 'tpope/vim-surround'                                           " smart surrounding (parens, quotes, etc)
" Plug 'editorconfig/editorconfig-vim'                                " NOTE: this plugin causes performance issues in neovim. Disable for now.
if g:terminal_env
    Plug 'haya14busa/vim-asterisk'                                      " better * operation handling
    Plug 'mileszs/ack.vim'                                              " search tool
    Plug 'wincent/terminus'                                             " Cursor, mouse, focus, and paste improvements
endif

" Window / UI
Plug 'tpope/vim-vinegar'                                            " project browser in split window
if g:terminal_env
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }   " fuzzy file finder/opener
    Plug 'airblade/vim-gitgutter'                                       " git signs in the gutter
    Plug 'terryma/vim-multiple-cursors'                                 " sublime-style multiple cursors
    Plug 'Lokaltog/vim-easymotion'                                      " easy moving within a file
    Plug 'vim-airline/vim-airline'                                      " statusline customization utility
    Plug 'edkolev/tmuxline.vim'                                         " tmux statusline generator with support for patched fonts
endif

" Styling
if g:terminal_env
    Plug 'bennettrogers/oceanic-next', { 'branch': 'sublime' }          " oceanicnext colorscheme (currently only used for its airline theme)
endif

" Language and syntax support
Plug 'Raimondi/delimitMate'                                         " smart handling of e.g. surrounding parens
if g:terminal_env
    Plug 'w0rp/ale'
    " Plug 'ludovicchabant/vim-gutentags'
    Plug 'mattn/emmet-vim'                                              " web development multitool
    Plug 'mattn/webapi-vim'                                             " api for emmet that enables custom snippets
    Plug 'othree/html5.vim'                                             " support html5 syntax
    Plug 'pangloss/vim-javascript'                                      " javascript friendliness
    Plug 'hail2u/vim-css3-syntax'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'Keithbsmiley/tmux.vim'                                        " tmux conf syntax highlighting
    Plug 'elzr/vim-json'                                                " json support
    Plug 'rodjek/vim-puppet'                                            " makes vim puppet-friendly
    Plug 'junegunn/vim-easy-align'                                      " align text
    Plug 'scrooloose/nerdcommenter'                                     " easy commenting with good support for compound filetypes
    Plug 'majutsushi/tagbar'                                            " shows the current symbols from this file
    Plug 'wavded/vim-stylus'                                            " stylus support
    Plug 'posva/vim-vue'                                                " Vuejs file syntax support
    Plug 'leafgarland/typescript-vim'                                   " Typescript support
    Plug 'mxw/vim-jsx'                                                  " JSX support
    Plug 'amadeus/vim-xml'
    Plug 'jparise/vim-graphql'                                          " GraphQL support
    " Commenting out styled-components plugin since it breaks javascript.jsx indentation
    " Plug 'styled-components/vim-styled-components', { 'branch': 'rewrite' }                      " Support for emotion.sh (and other styled-components type libs)
    " Plug 'python-mode/python-mode'
endif

" External command helpers
Plug 'tpope/vim-eunuch'                                             " syntactic sugar for some unix commands (e.g. sudo write)

" Fun bits
Plug 'ap/vim-css-color'                                             " Color previewer
Plug 'tpope/vim-scriptease'                                         " Vim scripting help - (used mainly for the syntax highlighting help)
