" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


let g:vimdir = '~/.vim'
let s:plug_file = g:vimdir . '/autoload/plug.vim'

if empty(glob(s:plug_file))
  let s:git_url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent exec '!curl -fLo ' . s:plug_file . ' --create-dirs ' . s:git_url
  unlet s:git_url
endif
unlet s:plug_file

exec 'source ' . g:vimdir . '/config/plugin.vim'
exec 'source ' . g:vimdir . '/config/basic.vim'
exec 'source ' . g:vimdir . '/config/mapping.vim'
exec 'source ' . g:vimdir . '/config/command.vim'
exec 'source ' . g:vimdir . '/config/function.vim'
exec 'source ' . g:vimdir . '/config/platform.vim'
exec 'source ' . g:vimdir . '/config/autocmd.vim'
exec 'source ' . g:vimdir . '/config/plugin_config.vim'

if filereadable(expand(g:vimdir . '/config/_local.vim'))
  exec 'source ' . g:vimdir . '/config/_local.vim'
endif
