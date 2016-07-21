" Nice NeoVim cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Enable truecolor in neovim
if exists('+termguicolors')
     set termguicolors
else
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
endif
