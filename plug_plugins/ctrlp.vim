" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'ctrlpvim/ctrlp.vim'
  finish
endif

" Ensure CtrlP isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
  " @ethanmuller
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <leader>, :CtrlPMRUFiles<cr>
