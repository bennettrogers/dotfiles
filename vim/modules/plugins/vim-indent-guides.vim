let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_auto_colors=0

augroup indent_guide_settings
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
augroup END
