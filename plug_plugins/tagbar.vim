" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'majutsushi/tagbar'
  finish
endif

if has('nvim')
  runtime! macros/matchit.vim
else
  packadd! matchit
endif

let g:tagbar_autofocs = 1
let g:tagbar_type_ruby = {
  \ 'kinds': [
  \   'm:modules',
  \   'c:classes',
  \   'd:describes',
  \   'C:contexts',
  \   'f:methods',
  \   'F:singleton methods'
  \ ] }

nnoremap <silent> <F3> :TagbarToggle<cr>
