function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
        cclose
    endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

cnoreabbrev help vert help
