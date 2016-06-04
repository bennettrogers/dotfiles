" Set all filetypes to active checking
let g:syntastic_mode_map = {
\   "mode": "active",
\ 	"passive_filetypes": []
\ }

" Recommended settings from documentation
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Put errors in the location list and specify its size
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5

" Check file on open and write
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Run all checkers even after one finds an error
let g:syntastic_aggregate_errors = 1

" Set the checkers for various filetypes
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['tidy']

" Ignore CSS warnings about IE6
let g:syntastic_css_csslint_quiet_messages = {
\   "regex":[
\     "IE6",
\   ]
\ }
