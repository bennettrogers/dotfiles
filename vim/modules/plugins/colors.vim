" Set up colors once colorscheme plugin has loaded
syntax enable
set background=dark
colorscheme OceanicNext

" Specify which terms to italicize
highlight htmlArg gui=italic
highlight Comment gui=italic
highlight Type    gui=italic
highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight Type    cterm=italic

" Set Airline theme
let g:airline_theme='oceanicnext'

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    set guifont=Monaco:h12
    colorscheme OceanicNext
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
