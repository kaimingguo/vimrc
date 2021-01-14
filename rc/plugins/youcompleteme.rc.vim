" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

"let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_filetype_blacklist = {
  \ 'notes': 1,
  \ 'unite': 1,
  \ 'tagbar': 1,
  \ 'pandoc': 1,
  \ 'qf': 1,
  \ 'vimwiki': 1,
  \ 'text': 1,
  \ 'infolog': 1,
  \ 'mail': 1,
  \ }

let g:ycm_language_server = [
  \   {
  \     'name': 'dart',
  \     'cmdline': ['dart', expand('/opt/local/libexec/dart-sdk/bin/snapshots/analysis_server.dart.snapshot'), '--lsp' ],
  \     'filetypes': ['dart'],
  \   },
  \ ]

" vim: set tabstop=2 softtabstop=2 shiftwidth=2 expandtab filetype=vim :
