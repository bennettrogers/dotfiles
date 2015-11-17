" Enable spellcheck.
set spell spelllang=en_us

" Invoke Goyo plugin.
" Note: for now we have to force-initialize lightline
" or else an error is thrown when Goyo tries to disable it.
" Hopefully we can remove this someday...
" call lightline#init()
" Goyo

" Initialize vim-pencil
call pencil#init({'wrap': 'soft'})
