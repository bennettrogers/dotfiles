let g:tmuxline_powerline_separators = 1

let g:tmuxline_theme = 'zenburn'

" To make a base tmuxline conf, use one of the presets (e.g. 'full')
" then call :TmuxlineSnapshot [filename] to save the current tmuxline configuration.
" Tweak it from there.
" let g:tmuxline_preset = 'full'

" tmuxline will set the status line layout when vim starts
" set this to 0 to disable so that the tmuxline snapshot isn't overwritten,
" so we can use our own tmuxline conf and theme that isn't mapped to airline.
let g:airline#extensions#tmuxline#enabled = 0
