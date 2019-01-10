" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'tpope/vim-fugitive'
  finish
endif

nnoremap <leader>gc :Gcommit -v<cr>
nnoremap <leader>gca :Gcommit -a -v<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gp :Git push<cr>

" Mnemonic, gu = Git Update
nnoremap <leader>gu :Git pull<cr>
nnoremap <leader>gd :Gvdiff<cr>

" Exit a diff by closing the diff window
nnoremap <leader>gx :wincmd h<cr>:q<cr>

" Start git command
nnoremap <leader>gi :Git<space>

" Undo the last commit
command! Gcundo :Git reset HEAD~1
