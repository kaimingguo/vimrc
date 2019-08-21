" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  finish
endif

let g:airline_theme = 'papercolor'
let g:airline_skip_empty_sections = 1

let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
