"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

" Load Pathogen
call pathogen#infect()
call pathogen#helptags()

" vim colors
"if &term =~ "xterm-256color"
set t_Co=256
colorscheme xoria256
"endif

" switch map leader to space
let mapleader=" "

nmap <leader>w :w!<cr>

" relative line numbering when in normal mode
if version >= 703
    set rnu
    au InsertEnter * :set nu
    au InsertLeave * :set rnu
    au FocusLost * :set nu
    au FocusGained * :set rnu
endif

" Set filetype stuff to on
filetype plugin indent on

" Switch on syntax highlighting.
syntax on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set the forward slash to be the slash of note.  Backslashes suck
set shellslash

" Make command line two lines high
set ch=1

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=ac

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 6 lines from the top and 6
" lines from the bottom
set scrolloff=6

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Make the command-line completion better
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" get rid of the silly characters in window separators
set fillchars=""

" Turn tabs into spaces
set expandtab

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" cycle through all open buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" parse json files as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

"-----------------------------------------------------------------------------
" Syntastic Plugin Settings
"-----------------------------------------------------------------------------
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }

"-----------------------------------------------------------------------------
" Powerline Plugin Settings
"-----------------------------------------------------------------------------
let g:Powerline_symbols = 'compatible'

"-----------------------------------------------------------------------------
" Tagbar Plugin Settings
"-----------------------------------------------------------------------------
map <leader>s :TagbarToggle<CR>

"-----------------------------------------------------------------------------
" Ctrl-P Plugin Settings
"-----------------------------------------------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = ''

"-----------------------------------------------------------------------------
" EasyMotion Plugin Settings
"-----------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
nmap s <leader>w
nmap S <leader>b

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    set guifont=Monaco:h12
    colorscheme xoria256
    if !exists("g:vimrcloaded")
        winpos 0 0
        if ! &diff
            winsize 130 90
        else
            winsize 227 90
        endif
        let g:vimrcloaded = 1
    endif
endif
:nohls
