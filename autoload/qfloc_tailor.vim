function! qfloc_tailor#adjust_window_height() abort
  let l:max_height = qfloc_tailor#utils#get_max_window_height()
  let l:list_length = qfloc_tailor#utils#get_list_length()
  call qfloc_tailor#utils#possibly_move_quickfix_window()

  if l:list_length > l:max_height
    call qfloc_tailor#utils#set_window_size(l:max_height)
  else
    call qfloc_tailor#utils#set_window_size(l:list_length + 1)
  endif
endfunction
