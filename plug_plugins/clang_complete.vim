" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'Rip-Rip/clang_complete', { 'do': 'make' }
  finish
endif

let g:clang_library_path = system('llvm-config --prefix')[:-2] . '/lib'
