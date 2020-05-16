if exists('g:loaded_qfloc_tailor')
  finish
endif

let g:loaded_qfloc_tailor = 1

augroup QfLoc_Tailor
  autocmd!
  autocmd BufReadPost quickfix call qfloc_tailor#adjust_window_height()
augroup END
