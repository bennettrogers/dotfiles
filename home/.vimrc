" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Wraps paths to make them relative to this directory.
" TODO: use e.g. <sfile> for this instead (and everywhere it's used)
function! Dot(path)
  return '~/.vim/' . a:path
endfunction

let g:oni_env = exists("g:gui_oni")
let g:terminal_env = !g:oni_env

if g:oni_env
    let g:DEIN_CACHE_DIR = expand('~/.vim/dein_plugins/.oni')
elseif g:terminal_env
    let g:DEIN_CACHE_DIR = expand('~/.vim/dein_plugins/.terminal')
endif

" Load default configuration modules
for file in glob(Dot('modules/default/*.vim'), 0, 1)
  execute 'source' file
endfor

" Load Oni configuration modules
if g:oni_env
  for file in glob(Dot('modules/oni/*.vim'), 0, 1)
    execute 'source' file
  endfor
endif
