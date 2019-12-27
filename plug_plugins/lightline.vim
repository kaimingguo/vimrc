" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

if exists('g:plug_installing_plugins')
  Plug 'itchyny/lightline.vim'
  finish
endif

let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['fugitive', 'readonly', 'filename', 'modified'] ],
  \   'right': [ ['lineinfo'],
  \              ['percent'],
  \              ['fileformat', 'fileencoding', 'filetype'] ]
  \ },
  \ 'inactive': {
  \   'left': [['filename']],
  \   'right': [['lineinfo', 'percent']]
  \ },
  \ 'tabline': {
  \   'left': [['tabs']],
  \   'right': [['close']]
  \ },
  \ 'component': {
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
  \   'lineinfo': '%3l:%-2v',
  \ },
  \ 'component_function': {
  \   'fugitive': 'LightlineFugitive',
  \ },
  \ 'component_function_visible_condition': {
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'component_expand': {},
  \ 'colorscheme': 'seoul256'
  \ }

function! LightlineFugitive() abort
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let l:branch = fugitive#head()
      return strlen(l:branch) ? l:branch : ''
    endif
  catch
  endtry
  return ''
endfunction

" vim: set sw=2 ts=2 et tw=78 :
