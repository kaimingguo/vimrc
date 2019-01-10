" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'mbbill/undotree'
  finish
endif

" Turn persistent undo on means that you can undo even when you
" close a buffer/VIM
if has('persistent_undo')
  set undofile
  exec 'set undodir=' . g:vimdir . '/.undo//'
endif

nnoremap <silent> <F4> :UndotreeToggle<cr>
