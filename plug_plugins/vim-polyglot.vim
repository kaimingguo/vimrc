" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'sheerun/vim-polyglot'
  finish
endif

let g:polyglot_disabled = ['javascript', 'markdown', 'python']
let g:vim_json_syntax_conceal = 1
