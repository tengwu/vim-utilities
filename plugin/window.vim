function! QuickfixWindowOpened()
  let l:ret = 0
  for winnr in range(1, winnr('$'))
    if getwinvar(winnr, '&syntax') == 'qf'
      let l:ret = 1
      break
    endif
  endfor
  return l:ret
endfunction

function! ToggleQuickfixList()
  let l:opened = QuickfixWindowOpened()
  if l:opened == 1
    echo 'cclose'
    exec 'cclose'
  else
    exec 'copen'
    echo 'copen'
  endif
endfunction
