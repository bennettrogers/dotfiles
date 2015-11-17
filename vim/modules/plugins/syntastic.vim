let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["html"]
  \ }
let g:syntastic_aggregate_errors = 1
let g:syntastic_html_checkers=['tidy', 'jshint']
