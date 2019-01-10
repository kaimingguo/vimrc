" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'ludovicchabant/vim-gutentags'
  finish
endif

let s:vim_tags = expand(g:vimdir . '/.tmp')
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = [
  \ '--fields=+niazS',
  \ '--extra=+q',
  \ '--c++-kinds=+px',
  \ '--c-kinds=+px' ]

if !isdirectory(s:vim_tags)
  silent! call mkdir(s:vim_tags, 'p')
endif
