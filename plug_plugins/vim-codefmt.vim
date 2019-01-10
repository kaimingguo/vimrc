" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  " Add maktaba and codefmt to the runtimepath.
  " (The latter must be installed before it can be used.)
  Plug 'google/vim-maktaba' | Plug 'google/vim-codefmt'
  " Also add Glaive, which is used to configure codefmt's maktaba flags. See
  " `:help :Glaive` for usage.
  Plug 'google/vim-glaive'
  finish
endif

try
  call glaive#Install()
catch
endtry
