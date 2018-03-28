" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

" Basic config
call dein#add('tpope/vim-sensible', {'merged': 0}) " good starting point for vimrc

" Behavioral improvements
call dein#add('haya14busa/incsearch.vim', {'merged': 0})  " highlight all incremental search matches
call dein#add('haya14busa/vim-asterisk', {'merged': 0})   " better * operation handling
call dein#add('mileszs/ack.vim', {'merged': 0})           " search tool
call dein#add('sjl/gundo.vim', {'merged': 0})             " graphical undo tree
call dein#add('tpope/vim-surround', {'merged': 0}) " smart surrounding (parens, quotes, etc)
" call dein#add('tpope/vim-sleuth', {'merged': 0})                                        " tries to match indent settings with what already exists in file
call dein#add('tpope/vim-unimpaired', {'merged': 0})      " shortcuts for common paired actions (e.g. next/prev error)
call dein#add('AndrewRadev/splitjoin.vim', {'merged': 0}) " quickly split/join lines into multiple/one
call dein#add('tpope/vim-repeat', {'merged': 0})          " allow for repeating plugin commands
" call dein#add('editorconfig/editorconfig-vim', {'merged': 0})    " NOTE: this plugin causes performance issues in neovim. Disable for now.
call dein#add('wincent/terminus', {'merged': 0})          " Cursor, mouse, focus, and paste improvements

" Window / UI
call dein#add('junegunn/fzf', { 'build': './install --all --no-update-rc', 'merged': 0 }) " fuzzy file finder/opener
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf', 'merged': 0 })
call dein#add('tpope/vim-vinegar', {'merged': 0})                                                        " project browser in split window
call dein#add('airblade/vim-gitgutter', {'merged': 0})                                                   " git signs in the gutter
" call dein#add('mhinz/vim-signify', {'merged': 0})                              " gitgutter replacement
" call dein#add('junegunn/goyo.vim', {'merged': 0})                              " distraction-free writing
call dein#add('terryma/vim-multiple-cursors', {'merged': 0}) " sublime-style multiple cursors
call dein#add('Lokaltog/vim-easymotion', {'merged': 0})      " easy moving within a file
if g:terminal_env
    call dein#add('vim-airline/vim-airline', {'merged': 0})  " statusline customization utility
    call dein#add('edkolev/tmuxline.vim', {'merged': 0})     " tmux statusline generator with support for patched fonts
endif

" Styling
call dein#add('bennettrogers/oceanic-next', { 'rev': 'sublime', 'merged': 0 }) " oceanicnext colorscheme (currently only used for its airline theme)
" call dein#add('~/workspace/repos/oceanic-next', { 'rev': 'sublime', 'merged': 0 })          " oceanicnext colorscheme (currently only used for its airline theme)
" call dein#add('nathanaelkane/vim-indent-guides', {'merged': 0})    " displays indent levels
" call dein#add('Yggdroot/indentLine', {'merged': 0})
call dein#add('amadeus/vim-evokai', {'merged': 0}) " full colorscheme (for comparison)

" Language and syntax support
" call dein#add('neomake/neomake', {'merged': 0})                                             " automatic syntax checking (e.g. JSHint linting)
call dein#add('w0rp/ale', {'merged': 0})
" call dein#add('ludovicchabant/vim-gutentags', {'merged': 0})
call dein#add('mattn/emmet-vim', {'merged': 0})          " web development multitool
call dein#add('mattn/webapi-vim', {'merged': 0})         " api for emmet that enables custom snippets
call dein#add('othree/html5.vim', {'merged': 0})         " support html5 syntax
call dein#add('pangloss/vim-javascript', {'merged': 0})  " javascript friendliness
call dein#add('hail2u/vim-css3-syntax', {'merged': 0})
call dein#add('cakebaker/scss-syntax.vim', {'merged': 0})
call dein#add('Keithbsmiley/tmux.vim', {'merged': 0})    " tmux conf syntax highlighting
call dein#add('elzr/vim-json', {'merged': 0})            " json support
call dein#add('rodjek/vim-puppet', {'merged': 0})        " makes vim puppet-friendly
call dein#add('reedes/vim-pencil', {'merged': 0})        " makes writing text (e.g. markdown) in vim easier
call dein#add('junegunn/vim-easy-align', {'merged': 0})  " align text
call dein#add('scrooloose/nerdcommenter', {'merged': 0}) " easy commenting with good support for compound filetypes
call dein#add('majutsushi/tagbar', {'merged': 0})        " shows the current symbols from this file
call dein#add('Raimondi/delimitMate', {'merged': 0})     " smart handling of e.g. surrounding parens
" call dein#add('rizzatti/dash.vim', {'merged': 0})                                            " dash integration for OSX
call dein#add('wavded/vim-stylus', {'merged': 0})          " stylus support
call dein#add('posva/vim-vue', {'merged': 0})              " Vuejs file syntax support
call dein#add('leafgarland/typescript-vim', {'merged': 0}) " Typescript support
call dein#add('mxw/vim-jsx', {'merged': 0})                " JSX support
call dein#add('amadeus/vim-xml', {'merged': 0})
call dein#add('jparise/vim-graphql', {'merged': 0})        " GraphQL support
" Commenting out styled-components plugin since it breaks javascript.jsx indentation
" call dein#add('styled-components/vim-styled-components', { 'rev': 'rewrite', 'merged': 0 })                      " Support for emotion.sh (and other styled-components type libs)
" call dein#add('python-mode/python-mode', {'merged': 0})

" External command helpers
call dein#add('tpope/vim-eunuch', {'merged': 0})   " syntactic sugar for some unix commands (e.g. sudo write)
call dein#add('tpope/vim-fugitive', {'merged': 0}) " git helpers
" call dein#add('vim-scripts/CSSMinister', {'merged': 0})

" Fun bits
call dein#add('ap/vim-css-color', {'merged': 0})     " Color previewer
call dein#add('tpope/vim-scriptease', {'merged': 0}) " Vim scripting help - (used mainly for the syntax highlighting help)
