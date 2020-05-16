function! qfloc_tailor#utils#get_max_window_height() abort
  if qfloc_tailor#utils#is_location_list_window()
    return get(g:, 'qfloc_tailor_max_height_location_window', 5)
  elseif qfloc_tailor#utils#is_quickfix_list_window()
    return get(g:, 'qfloc_tailor_max_height_quickfix_window', 10)
  endif
endfunction

function! qfloc_tailor#utils#get_list_length() abort
  if qfloc_tailor#utils#is_location_list_window()
    return len(getloclist(0))
  elseif qfloc_tailor#utils#is_quickfix_list_window()
    return len(getqflist())
  endif
endfunction

function! qfloc_tailor#utils#set_window_size(size) abort
  execute 'resize ' . a:size
endfunction

function! qfloc_tailor#utils#possibly_move_quickfix_window() abort
  if qfloc_tailor#utils#is_location_list_window() | return | endif
  let l:wincmd_direction = get(g:, 'qfloc_tailor_quickfix_window_direction', 'J')
  execute 'wincmd ' . l:wincmd_direction
endfunction

function! qfloc_tailor#utils#is_location_list_window() abort
  let [l:quickfix_option, l:location_option] = s:get_quickfix_location_option()
  return qfloc_tailor#utils#has_qfloc_filetype()
        \ && l:quickfix_option && l:location_option
endfunction

function! qfloc_tailor#utils#is_quickfix_list_window() abort
  let [l:quickfix_option, l:location_option] = s:get_quickfix_location_option()
  return qfloc_tailor#utils#has_qfloc_filetype()
        \ && l:quickfix_option && !l:location_option
endfunction

function! qfloc_tailor#utils#has_qfloc_filetype() abort
  return &filetype ==# 'qf'
endfunction

function! s:get_quickfix_location_option() abort
  let l:window_id = win_getid()
  let l:window_info = getwininfo(l:window_id)[0]
  let l:quickfix_option = get(l:window_info, 'quickfix', 0)
  let l:location_option = get(l:window_info, 'loclist', 0)
  return [l:quickfix_option, l:location_option]
endfunction
