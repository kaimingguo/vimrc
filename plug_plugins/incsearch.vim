" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  finish
endif

function! s:ConfigEasyFuzzyMotion(...) abort
  return extend(copy({
    \ 'converters': [incsearch#config#fuzzy#converter()],
    \ 'modules': [incsearch#config#easymotion#module()],
    \ 'keymap': {"\<CR>": '<Over>(easymotion)'},
    \ 'is_expr': 0,
    \ 'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction

map / <plug>(incsearch-forward)
map ? <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)

noremap <silent> <expr> z/ incsearch#go(<sid>ConfigEasyFuzzyMotion())
