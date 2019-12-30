" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

if exists('g:plug_installing_plugins')
  Plug 'majutsushi/tagbar'
  finish
endif

nmap <silent> <F3> :TagbarToggle<cr>

" vim: set sw=2 ts=2 et tw=78 :
