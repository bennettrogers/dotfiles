" Use ag for searching
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'
endif

" Open ctrlspace with the default ctrl-p binding
nnoremap <silent><C-p> :CtrlSpace O<CR>

" Set the search delay how I like it
let g:CtrlSpaceSearchTiming = 150

" Customize the project root markers
let g:CtrlSpaceProjectRootMarkers = [
\   ".git",
\   ".hg",
\   "node_modules",
\ ]
