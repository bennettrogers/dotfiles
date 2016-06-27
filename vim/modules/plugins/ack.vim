" use silver-searcher if it's available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" highlight the searched term
let g:ackhighlight = 1

" automagically open the result when navigating with j/k
let g:ackpreview = 1
