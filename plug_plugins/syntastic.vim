" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

if exists('g:plug_installing_plugins')
  Plug 'scrooloose/syntastic'
  finish
endif

let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_echo_current_error = 1

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '▲'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '▲'

if exists('&signcolumn')
  set signcolumn=yes
endif

highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap
highlight SyntasticErrorSign ctermfg=1 guifg=#BF616A
highlight SyntasticWarningSign ctermfg=3 guifg=#EBCB8B

" vim: set sw=2 ts=2 et tw=78 :
