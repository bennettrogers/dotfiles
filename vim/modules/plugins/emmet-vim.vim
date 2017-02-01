" Change leader key
let g:user_emmet_leader_key='<C-S>'

" Indent block elements and place the cursor as I expect
let g:user_emmet_settings = {
\  'html' : {
\    'indent_blockelement': 1,
\  },
\}

" " Load custom snippets file
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(Dot('modules/plugins/snippets_custom.json'))), "\n"))
