" Change leader key
let g:user_emmet_leader_key='<C-S>'

" " Load custom snippets file
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(Dot('modules/plugins/snippets_custom.json'))), "\n"))

" Tell emmet that javascript.jsx should be treated like jsx
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
