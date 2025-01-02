if g:terminal_env
    " Set up colors once colorscheme plugin has loaded
    syntax enable
    let g:onedark_terminal_italics = 1
    colorscheme onedark

    " Specify which terms to italicize
    highlight htmlArg gui=italic
    highlight htmlArg cterm=italic
    highlight Comment gui=italic
    highlight Comment cterm=italic
    highlight Todo    gui=italic
    highlight Todo    cterm=italic

    " Set Airline theme
    let g:airline_theme='zenburn'

endif

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
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
