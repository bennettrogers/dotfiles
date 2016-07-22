" Set up colors once colorscheme plugin has loaded
syntax enable
set background=dark
colorscheme base16-oceanicnext

" Specify which terms to italicize
highlight htmlArg gui=italic
highlight htmlArg cterm=italic
highlight Comment gui=italic
highlight Comment cterm=italic
highlight Todo    gui=italic
highlight Todo    cterm=italic

" Set Airline theme
let g:airline_theme='oceanicnext'

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    set guifont=Monaco:h12
    colorscheme base16-oceanicnext
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
