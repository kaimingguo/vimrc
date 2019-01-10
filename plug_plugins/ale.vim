" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'w0rp/ale'
  finish
endif

let g:ale_linters = {
  \ 'c': ['clangtidy'],
  \ 'cpp': ['clangtidy'],
  \ 'python': ['flake8', 'pylint'],
  \ 'javascript': ['eslint'] }

" Otherwise huge files might get linted and freeze
let g:ale_lint_on_enter = 0

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

if exists('&signcolumn')
  set signcolumn=yes
endif

if has('autocmd')
  augroup vimrc_ale_settings
    au!
    au VimEnter,FilterWritePre * if &diff | ALEDisable | endif
    au User ALELint call <sid>MaybeUpdateLightline()
  augroup END
endif

""
" @private
" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline() abort
  if exists('#lightline')
    call lightline#update()
  endif
endfunction
