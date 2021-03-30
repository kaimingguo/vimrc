" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

if has('autocmd')
	augroup auto_custom_settings
		" clear the auto command group so we don't define it multiple times idea
    " from: http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    autocmd!

    " when editing a file, always jump to the last current position
    " this must be after the uncompress command
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') |
      \ exe "normal! g'\"" | endif

    " resize splits when the window is resized
    " From: https://bitbuck.org/sjl/dotfiles/src/tip/vim/vimrc
    autocmd VimResized * :wincmd =

    " disable visualbell
    autocmd GUIEnter * set visualbell t_vb=

    " the PC is fast enough, do syntax highlight syncing from start unless
    " 200 lines
    autocmd BufEnter * :syntax sync maxlines=200
	augroup END
endif

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set ts=2 sts=2 sw=2 et tw=78 ft=vim foldenable foldmethod=marker :
