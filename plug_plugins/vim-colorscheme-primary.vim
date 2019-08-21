" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'google/vim-colorscheme-primary'
  finish
endif

set t_Co=256
if has('mac')
  if system('defaults read -g AppleInterfaceStyle') =~ '^Dark'
    set background=dark
  else
    set background=light
  endif
endif

try
  colorscheme primary
catch
endtry
