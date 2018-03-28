" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.vim/' . a:path
endfunction

" Load default configuration modules.
for file in glob(Dot('modules/default/*.vim'), 0, 1)
  execute 'source' file
endfor

" Load Oni configuration modules
if exists("g:gui_oni")
  for file in glob(Dot('modules/oni/*.vim'), 0, 1)
    execute 'source' file
  endfor
endif

" if has('nvim')
" endif
