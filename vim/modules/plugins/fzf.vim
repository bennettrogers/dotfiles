" use fzf like ctrl-p
nnoremap <silent><C-p> :FZF<CR>

" use ag as the input command for fzf when possible
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif
