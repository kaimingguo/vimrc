" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'scrooloose/nerdtree'
  finish
endif

let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeWinSize = 35
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeNodeDelimiter = "\u00a0"

let g:NERDTreeIgnore = [
  \ '\.rbc$',
  \ '\~$',
  \ '\.pyc$',
  \ '\.db$',
  \ '\.sqlite$',
  \ '__pycache__' ]
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']

nnoremap <silent> <F2> :NERDTreeToggle<cr>:wincmd = <cr>

if has('autocmd')
  augroup vimrc_nerdtree_settings
    autocmd!

    " Close Vim if NERDTree is the last buffer
    autocmd BufEnter * if (winnr('$') is# 1
      \ && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

    autocmd FileType nerdtree setlocal nocursorline
  augroup END
endif
