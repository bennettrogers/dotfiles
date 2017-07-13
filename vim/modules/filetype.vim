" HTML stuff

" Note: don't do this yet:
" 1) neomake doesn't support it yet
" 2) i'm not currently using js in html files (unless i go back to polymer)
" au BufNewFile,BufRead *.html set filetype=html.javascript

" Wrap whitespace between <li> elements in html comments.
" This preserves layout while allowing for inline-block grids
" NOTE: commenting this out as of 2017/06/05 until I know I need it again
" au BufWritePre *.html :%s/\(<\/li>\)\(\_s\+\)\(<li\)/\1<!--\2-->\3/e

"-----------------------------------------------"

" Vue stuff
" NOTE: commeting this out as of 2017/06/05 to see if vim-vue handles it ok
" autocmd BufNewFile,BufRead *.vue set filetype=vue.html.javascript.scss.css
