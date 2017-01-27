let g:ft = ''
fu! NERDCommenter_before()
  if &ft =~ 'vue'
    let g:ft = &ft
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft =~ 'vue'
    let &ft=g:ft
    let g:ft = ''
  endif
endfu

