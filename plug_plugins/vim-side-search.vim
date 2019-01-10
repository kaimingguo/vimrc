" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'ddrscott/vim-side-search'
  finish
endif

let g:side_search_prg = 'ag --smart-case --heading --stats -C 2 --group'

nnoremap <leader>as :SideSearch<space>
