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

" Removing html from filetype declaration so that tidy stops complaining about
" custom components/attributes. Remove this once
" https://github.com/htacg/tidy-html5/issues/119 is closed
autocmd BufNewFile,BufRead *.vue set filetype=vue.javascript.css
