function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         lopen
    else
        lclose
        cclose
    endif
endfunction

" use ctrl-e to open and close the quickfix window
nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

" open help files in a vertical split
cnoreabbrev help vert help

" close vim if the quickfix window is the only window left
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Open netrw in tree mode by default
let g:netrw_liststyle = 3
