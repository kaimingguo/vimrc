" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
  finish
endif

let g:UltiSnipsSnippetDirectories = ['ultisnips']
let g:UltiSnipsExpandTrigger = '<C-c>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit = 'vertical'
