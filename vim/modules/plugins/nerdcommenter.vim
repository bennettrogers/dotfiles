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
    \ 'htmltag': {  'left': '<!-- ', 'right': '-->', 'leftAlt': '/*','rightAlt': '*/' },
\}

" Make it work on single-file Vue components
let g:ft = ''
function! NERDCommenter_before()
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
        endif
        exe 'setf ' . tolower(syn)
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft =~ 'vue'
    " setf g:ft
	let &ft=g:ft
    let g:ft = ''
  endif
endfunction
