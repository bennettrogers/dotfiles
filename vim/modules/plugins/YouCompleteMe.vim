" Use tern for autocompletion for javascript files
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Create GoTo mapping for non-blacklisted filetypes (i.e. not javascript)
fun! SetMaps()
  if !exists('b:noSetMaps')
    nnoremap <buffer> <leader>d :YcmCompleter GoTo<CR>
  endif
endfun
autocmd FileType javascript let b:noSetMaps=1
autocmd BufEnter * call SetMaps()
