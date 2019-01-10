" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


""
" @private
" Don't close window, when deleting a buffer
function! s:BufClose() abort
  let l:current_buf_num = bufnr('%')
  let l:alternate_buf_num = bufnr('#')

  if buflisted(l:alternate_buf_num)
    buffer #
  else
    bnext
  endif

  if bufnr('%') is# l:current_buf_num
    new
  endif

  if buflisted(l:current_buf_num)
    execute('bdelete! ' . l:current_buf_num)
  endif
endfunction
command! Bclose call <sid>BufClose()

""
" @private
" Quick spelling fix (first item in z= list)
function! s:QuickSpellingFix() abort
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction
command! QuickSpellingFix call <sid>QuickSpellingFix()

""
" @private
" Paste using paste mode, keeps indentation in source.
function! s:PasteWithPasteMode() abort
  if &paste
    normal p
  else
    " Enable paste mode and paste the text, then disable paste mode.
    set paste
    normal p
    set nopaste
  endif
endfunction
command! PasteWithPasteMode call <sid>PasteWithPasteMode()
