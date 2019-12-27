" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

if exists('g:plug_installing_plugins')
  Plug 'vimwiki/vimwiki'
  finish
endif

if has('autocmd')
  augroup auto_vimwiki_settings
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=vimwiki
  augroup END
endif

let g:vimwiki_default = {}
let g:vimwiki_default.path = '$HOME/Documents/wiki'
let g:vimwiki_default.path_html = '$HOME/Documents/wiki_html'
let g:vimwiki_default.template_path = expand($VIM_PATH) . '/templates/wiki/'
let g:vimwiki_default.syntax = 'markdown'
let g:vimwiki_default.ext = '.md'
let g:vimwiki_default.custom_wiki2html = expand($VIM_PATH) . '/tools/wiki2html.sh'

let g:vimwiki_list = [g:vimwiki_default]

" vim: sw=2 ts=2 et tw=78 :
