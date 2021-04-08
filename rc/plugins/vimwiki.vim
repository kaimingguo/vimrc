" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

let g:vimwiki_list_setting = get(g:, 'vimwiki_list_setting', {})
let vimwiki_list_default = {
  \ 'path': '$HOME/.wiki',
  \ 'path_html': '$HOME/Documents/wiki_html',
  \ 'template_path': expand($VIM_PATH).'/templates/wiki/',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'custom_wiki2html': expand($VIM_PATH).'/tools/wiki2html',
  \ }

let g:vimwiki_list = [extend(vimwiki_list_default, g:vimwiki_list_setting)]

" vim: set ts=2 sts=2 sw=2 et tw=78 ft=vim foldenable foldmethod=marker :
