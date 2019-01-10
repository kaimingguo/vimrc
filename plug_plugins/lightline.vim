" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'itchyny/lightline.vim' | Plug 'taohexxx/lightline-buffer'
  finish
endif

let g:lightline_buffer_enable_devicons = 0
let g:lightline_buffer_show_bufnr = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']
let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20


let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['gitbranch', 'filename', 'tagbar'] ],
  \   'right': [ ['lineinfo'],
  \              ['percent'],
  \              ['spell', 'fileformat', 'filetype'],
  \              ['linter_warnings', 'linter_errors', 'linter_ok'] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['bufferinfo'],
  \             ['separator'],
  \             ['bufferbefore', 'buffercurrent', 'bufferafter'] ],
  \   'right': [ ['close'] ]
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v / B:%n W:%{winnr()}',
  \   'gitbranch': ' %{fugitive#head()}',
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \ },
  \ 'component_function': {
  \   'filename': 'LightlineFilename',
  \   'filetype': 'LightlineFiletype',
  \   'fileformat': 'LightlineFileformat',
  \   'linter_warnings': 'LightlineLinterWarnings',
  \   'linter_errors': 'LightlineLinterErrors',
  \   'linter_ok': 'LightlineLinterOk',
  \   'bufferinfo': 'lightline#buffer#bufferinfo'
  \ },
  \ 'component_visible_condition': {
  \   'gitbranch': 'fugitive#head() !=# ""'
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter'
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \   'close': 'raw'
  \ },
  \ 'mode_map': {
  \   'n': 'N',
  \   'i': 'I',
  \   'R': 'R',
  \   'v': 'V',
  \   'V': 'V',
  \   "\<C-v>": 'V',
  \   'c': 'C',
  \   's': 'S',
  \   'S': 'S',
  \   "\<C-s>": 'S',
  \   't': 'T'
  \ }
  \ }

function! s:LightlineAleLinter(option) abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if a:option =~? 'warning'
    return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
  elseif a:option =~? 'error'
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
  else
    return l:counts.total == 0 ? '✓' : ''
  endif
endfunction

function! s:LightlineModified() abort
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! s:LightlineReadonly() abort
  return &ft !~? 'help\|vimfiler' && &readonly ? '' : ''
endfunction

function! LightlineFilename() abort
  let l:fname = expand('%:t')
  return l:fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
    \ l:fname == '__Tagbar__' ? g:lightline.fname :
    \ l:fname =~ '__Gundo\|NERD_tree' ? '' :
    \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
    \ &ft == 'unite' ? unite#get_status_string() :
    \ &ft == 'vimshell' ? vimshell#get_status_string() :
    \ ('' != <sid>LightlineReadonly() ? <sid>LightlineReadonly() . ' ' : '') .
    \ ('' != l:fname ? l:fname : '[No Name]') .
    \ ('' != <sid>LightlineModified() ? ' ' . <sid>LightlineModified() : '')
endfunction

function! LightlineFiletype() abort
  return winwidth(0) > 70 ?
    \ (strlen(&filetype) ?
      \ (exists('*WebDevIconsGetFileTypeSymbol') ?
        \ printf('%s %s', &filetype, WebDevIconsGetFileTypeSymbol()) :
        \ &filetype) : 'no ft') : ''
endfunction

function! LightlineFileformat() abort
  return winwidth(0) > 70 ?
    \ (exists('*WebDevIconsGetFileFormatSymbol') ?
      \ printf('%s %s', &fileformat, WebDevIconsGetFileFormatSymbol()) :
      \ &fileformat) : ''
endfunction

function! LightlineLinterOk() abort
  return <sid>LightlineAleLinter('ok')
endfunction

function! LightlineLinterErrors() abort
  return <sid>LightlineAleLinter('error')
endfunction

function! LightlineLinterWarnings() abort
  return <sid>LightlineAleLinter('warning')
endfunction
