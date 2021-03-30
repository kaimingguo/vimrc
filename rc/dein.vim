" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

let g:cache_path =
  \ get(g:, 'cache_path', expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '$HOME/.cache')))

let s:dein_dir = expand(g:cache_path).'/dein'
let s:dein_repo_dir = expand(s:dein_dir).'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if &runtimepath !~# expand($VIM_PATH)
  execute 'set runtimepath^=' . substitute(
    \ fnamemodify(s:dein_repo_dir, ':p'), '/$', '', '')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:rc_dir = expand($VIM_PATH).'/rc'

  if has('lambda')
    let s:toml =
      \ [{'name': expand(s:rc_dir).'/dein.toml', 'lazy': 0},
      \  {'name': expand(s:rc_dir).'/dein_lazy.toml', 'lazy': 1}]
    call map(s:toml, {_, t -> dein#load_toml(t['name'], {'lazy': t['lazy']})})
  else
    call dein#load_toml(expand(s:rc_dir).'/dein.toml', {'lazy': 0})
    call dein#load_toml(expand(s:rc_dir).'/dein_lazy.toml', {'lazy': 1})
  endif
  unlet s:rc_dir

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
endif
set secure

" vim: set ts=2 sts=2 sw=2 et tw=78 ft=vim foldenable foldmethod=marker :
