" Set all filetypes to active checking
let g:syntastic_mode_map = {
\   "mode": "active",
\ 	"passive_filetypes": []
\ }

" Ignore CSS warnings about IE6
let g:syntastic_css_csslint_quiet_messages = {
\ 	"regex":	[
\                   "IE6",
\                   "!important"
\               ]
\ }

" Recommended settings from documentation
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" Set the checkers for various filetypes
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['tidy']
