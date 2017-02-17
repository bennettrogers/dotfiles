" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Chill a bit before getting up in my face
let g:ale_lint_delay = 2000

" This is already handled globally elsewhere
let g:ale_warn_about_trailing_whitespace = 0

" Choose which linters to run
" TODO: Consider removing this once https://github.com/htacg/tidy-html5/issues/119 is closed
let g:ale_linters = {'html': []}
