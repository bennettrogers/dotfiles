" Note: makers will only be run if they are listed for every filetype of a
" compound-filetype file (e.g. filetype=html.javascript)
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_html_enabled_makers = ['tidy', 'eslint']
" let g:neomake_python_enabled_makers = ['pylint']

" let g:neomake_echo_current_error = 1
" let g:neomake_serialize = 0
" let g:neomake_serialize_abort_on_error = 0

" let g:neomake_airline = 1

" autocmd! BufWritePost * Neomake


" Custom makers

" let g:neomake_html_eslint_maker = {
"     \ 'args': ['-f', 'compact'],
"     \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"     \ '%W%f: line %l\, col %c\, Warning - %m'
"     \ }
