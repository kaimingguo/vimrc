" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if has('autocmd')
  augroup auto_custom_settings
    " Clear the auto command group so we don't define it multiple times idea
    " from: http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    autocmd!

    " When editing a file, always jump to the last current position
    " This must be after the uncompress command
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') |
      \ exe "normal! g'\"" | endif

    " Resize splits when the window is resized
    " From: https://bitbuck.org/sjl/dotfiles/src/tip/vim/vimrc
    autocmd VimResized * :wincmd =

    " Disable visualbell
    autocmd GUIEnter * set visualbell t_vb=

    " The PC is fast enough, do syntax highlight syncing from start unless
    " 200 lines
    autocmd BufEnter * :syntax sync maxlines=200
  augroup END

  augroup vimrc_make_settings
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
  augroup END
endif
