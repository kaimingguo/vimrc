" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'pangloss/vim-javascript'
  finish
endif

let g:javascript_plugin_flow = 1
let g:javascript_enable_domhtmlcss = 1
