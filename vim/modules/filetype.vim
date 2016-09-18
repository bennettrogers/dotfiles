" HTML stuff

" Note: don't do this yet:
" 1) neomake doesn't support it yet
" 2) i'm not currently using js in html files (unless i go back to polymer)
" au BufNewFile,BufRead *.html set filetype=html.javascript

" Wrap whitespace between <li> elements in html comments.
" This preserves layout while allowing for inline-block grids
au BufWritePre *.html :%s/\(<\/li>\)\(\_s\+\)\(<li\)/\1<!--\2-->\3/e

"-----------------------------------------------"

" Vue stuff

" Setting filetype to html seems to offer the best syntax/indent support
autocmd BufNewFile,BufRead *.vue set filetype=html
