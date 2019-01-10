" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


" Specify a directory for plugins
call plug#begin(g:vimdir . '/plugged')
let g:plug_installing_plugins = 1

" Source all the plugins with a global variable set that ensures only the
" `Plug 'name'` code will be called
for file in split(glob(g:vimdir . '/plug_plugins/*.vim'), "\n")
  exe 'source' fnameescape(file)
endfor
for file in split(glob(g:vimdir . '/plug_plugins/custom/*.vim'), "\n")
  exe 'source' fnameescape(file)
endfor

unlet g:plug_installing_plugins
" Initialize plugin system
call plug#end()
