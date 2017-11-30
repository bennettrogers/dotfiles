" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_scss = 1

" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
    \ 'htmltag': {  'left': '<!--', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
    \ 'jsx': {  'left': '{/*', 'right': '*/}' },
\}

" Hacks to get NerdCommenter working on files with different syntax regions
let g:ft = ''
function! NERDCommenter_before()
  " Make it work on single-file Vue components
  if &ft =~ 'vue'
    let g:ft = &ft
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      :echom syn
      if len(syn) > 0
        " hack to get all html syntax types to work (e.g. HtmlEndTag)
        if syn =~ '^html'
          let syn = 'html'
          exe 'setf ' . tolower(syn)
        endif
      endif
    endif
  endif
  " Make it work in JSX regions of .js files
  " NOTE: this is a hack. it doesn't properly handle e.g. the first line of a JSX block, or (apparently) closing tags
  if &ft =~ 'jsx'
    let g:ft = &ft
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[-1], 'name')
      if len(syn) > 0
        if syn =~ '^jsx'
          let syn = 'jsx'
          exe 'setf ' . tolower(syn)
        endif
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft =~ 'vue' || g:ft =~ 'jsx'
    " setf g:ft
    let &ft=g:ft
    let g:ft = ''
  endif
endfunction

