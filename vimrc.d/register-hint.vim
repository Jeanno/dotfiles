function! s:close(id) abort
  bw! "register"
endfunc

function! s:open() abort

  " save what is in the cmdline
  let cmd = getcmdline()

  " exit cmdline mode
  call feedkeys("\<C-U>\<Esc>", 'n')

  " open the split
  3new 'register'

  " write the registers content
  call setline(1, ["a: " . getreg('a'), "b: " . getreg('b'), "c: " . getreg('c')])

  " setup the timer to close the split
  call timer_start(1, function('s:close'))

  " go back to the cmdline and restore cmd
  call feedkeys(':'.. cmd .."\<C-R>", 'n')
endfunc

cnoremap <C-R> <cmd>call <SID>open()<CR>

