" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

if exists('g:plug_installing_plugins')
  Plug 'haya14busa/incsearch.vim'
  finish
endif

if has('autocmd')
  augroup auto_incsearch_settings
    autocmd!

    autocmd CmdLineEnter [/\?] set nohlsearch
    autocmd CmdLineLeave [/\?] set hlsearch
  augroup END
endif

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)

nnoremap <silent> <esc><esc> :<C-u>nohlsearch<cr>

" vim: set sw=2 ts=2 et tw=78 :
