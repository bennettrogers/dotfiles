if has('nvim')  " NEOVIM

    " Nice NeoVim cursor shape
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $TMUX_TUI_ENABLE_SHELL_CURSOR=1

    " Enable truecolor
    if exists('+termguicolors')
        set termguicolors
    else
         let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

else            " VIM

    if exists('+termguicolors')
        set termguicolors
    endif

    " set Vim-specific sequences for RGB colors
    " necessary for truecolor support under tmux (apparently)
    " https://github.com/vim/vim/issues/993#issuecomment-255651605
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

endif
