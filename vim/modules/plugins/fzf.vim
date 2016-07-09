" use fzf like ctrl-p
nnoremap <silent><C-p> :FZF<CR>

" use ag as the input command for fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
