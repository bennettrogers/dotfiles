" use fzf like ctrl-p
nnoremap <silent><C-p> :FZF<CR>

" use ripgrep as the input command for fzf when possible
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --column --no-heading --hidden --follow --glob "!.git/*"'
endif
