" Use ag for searching
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Open ctrlspace with the default ctrl-p binding
nnoremap <silent><C-p> :CtrlSpace O<CR>

" Set the search delay how I like it
let g:CtrlSpaceSearchTiming = 150
