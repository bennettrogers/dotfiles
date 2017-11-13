"-----------------------------------------------------------------------------
" Global Stuff
"-----------------------------------------------------------------------------

" switch map leader to space
let mapleader=" "

" relative line numbering when in normal mode
" TODO: commenting this out for now, since I rarely use it
" if version >= 703
"     set rnu
"     au InsertEnter * :set nu
"     au InsertLeave * :set rnu
"     au FocusLost * :set nu
"     au FocusGained * :set rnu
" endif

" Write files as they are, don't mess with line endings etc.
" NOTE: this has to come before set expandtab or it will disable it
set binary

" Default indentation and tab handling
set tabstop=4
set shiftwidth=4
set expandtab

" More natural splitting.
set splitbelow
set splitright

" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

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

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Send more characters to the terminal at once.
" Makes things smoother, will probably be enabled by my terminal anyway.
set ttyfast

" Enable persistent undo.
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Don't update the display while executing macros
set lazyredraw

set updatetime=250
" Lower the interval before vim updates e.g. gitgutter (and writes to the swapfile)

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=ac

" Folding {{{

" Enable folding
set foldenable

" Use syntax
set foldmethod=syntax

" Don't fold on open
set foldlevelstart=99

" Reset folds and center the cursor
nnoremap <leader>; zMzvzz

" Toggle the current fold
nnoremap ; za

" Make the fold text look pretty
function! NeatFoldText() " {{{2
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
" }}}2
set foldtext=NeatFoldText()
" }}}

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" get rid of the silly characters in window separators
set fillchars=""

" Set the auto-line-commenting options the way I like
" This has to be done with an autocommand since the default vim ftplugins override .vimrc
" See the following for more information:
" https://stackoverflow.com/questions/16030639/vim-formatoptions-or/23326474#23326474
" http://peox.net/articles/vimconfig.html
augroup Format-Options
    autocmd!
	" Set the options we want
    " autocmd BufEnter * setlocal formatoptions=jcql

	" Can also just remove settings we don't like, if desired
	autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" Toggle spellcheck
nmap <silent> <leader>sp :set invspell spelllang=en_us<CR>:set spell?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" cycle through all open buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" write the current buffer
nmap <leader>w :w<CR>

" quit the current buffer
nmap <leader>q :q<CR>

" avoid using ctrl-c for esc (use <C-[> kj instead)
" inoremap kj <Esc>
inoremap <C-c> <nop>

" yank to the system clipboard
set clipboard=unnamed

" TODO: create a 'navigation' module
" jump to the next error
" function! LocationNext()
  " try
    " lnext
  " catch
    " try | lfirst | catch | endtry
  " endtry
" endfunction

" nnoremap <leader>e :call LocationNext()<cr>
