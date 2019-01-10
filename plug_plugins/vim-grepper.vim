" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'mhinz/vim-grepper'
  finish
endif

nnoremap <leader>ag :Grepper -tool ag<cr>

let g:grepper = {
  \ 'tools': ['ag'],
  \ 'ag': {
  \   'grepprg': 'ag --vimgrep --smart-case' } }
