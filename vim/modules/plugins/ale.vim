" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Chill a bit before getting up in my face
let g:ale_lint_delay = 2000

" This is already handled globally elsewhere
let g:ale_warn_about_trailing_whitespace = 0

" Choose which linters to run
" TODO: Consider removing this once https://github.com/htacg/tidy-html5/issues/119 is closed
" TODO: Add back python support once configured properly to not be so
" distracting
let g:ale_linters = {'html': [], 'python': []}

let g:ale_fixers = { 'javascript': ['eslint', 'prettier'], 'json': ['prettier']}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" TODO: detect e.g. .vue extension for setting syntax to scss
let g:ale_css_stylelint_options = '--syntax scss'
