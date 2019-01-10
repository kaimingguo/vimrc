" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'xolox/vim-session'
  finish
endif

let g:session_autosave = 0
let g:session_autoload = 0

nnoremap <leader>os :OpenSession<cr>
