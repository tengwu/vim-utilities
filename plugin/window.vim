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
  let l:own = winnr()
  let l:opened = QuickfixWindowOpened()
  if l:opened == 1
    exec 'cclose'
  else
    exec 'copen'
    let l:cmd = 'exe '.l:own.' . "wincmd w"'
    exec l:cmd
  endif
endfunction
