" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=','

" No-op ^ and $ while learning H and L
noremap ^ <nop>
noremap $ <nop>
nnoremap <leader>sc <nop>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Just to beginning and end of line easier
" From: http://vimbits.com/bits/16
noremap H ^
noremap L $

" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Open terminal emulator
if has('nvim')
  nnoremap <silent> <leader>sh :terminal<cr>
else
  nnoremap <silent> <leader>sh :VimShellCreate<cr>
endif

" Buffer
noremap <silent> <leader>bp :bprevious<cr>
noremap <silent> <leader>bn :bnext<cr>
noremap <silent> <leader>bx :Bclose<cr>
noremap <leader>bw :badd<space>

" Smart way to move between window
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Create newlines without entering insert mode
nnoremap go o<esc>k
nnoremap gO O<esc>j

" Remap `U` to `<C-r>` for easier redo
" From: http://vimbits.com/bits/356
nnoremap U <C-r>

" Do not move on *
nnoremap <silent>* :let stayStarView=winsaveview()<cr> *:call winrestview(stayStarView)<cr>

" Equal size windows
nnoremap <silent>s= :wincmd =<cr>

" Swap windows
nnoremap <silent>sx :wincmd x<cr>

" Hightlight search word under cursor without jumping to next
noremap <leader>h *<C-O>

" Disable highligh when `<leader>/` is pressed
nnoremap <silent> <leader>/ :nohls<cr>

" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>ss :split<bar>:wincmd j<cr>:wincmd =<cr>
nnoremap <silent> <leader>sv :vsplit<bar>:wincmd l<cr>:wincmd =<cr>

" Set working directory
nnoremap <leader>. :lcd %:p:h<cr>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-r>=expand("%:p:h") . "/" <cr>

" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-r>=expand("%:p:h") . "/" <cr>

" Vmap for maintain Visual Mode after shifting > and <
vmap > >gv
vmap < <gv

" Move vissual block
vnoremap J :m '>+1<cr>gv=gv'
vnoremap K :m '<-2<cr>gv=gv'

" Inserts the path of the currently edited file into a command
cnoremap <C-p> <C-r>=expand('%:p:h') . '/' <cr>

" copy current file name (relative/absolute) to system clipboard
" from http://stackoverflow.com/a/17096082/22423
if has('mac') || has('gui_macvim') || has('gui_mac')
  " relative path  (src/foo.txt)
  nnoremap <silent><leader>yp :let @*=expand("%")<cr>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent><leader>yP :let @*=expand("%:p")<cr>

  " filename       (foo.txt)
  nnoremap <silent><leader>yf :let @*=expand("%:t")<cr>

  " directory name (/something/src)
  nnoremap <silent><leader>yd :let @*=expand("%:p:h")<cr>
endif

if has('macunix')
  vmap <C-x> :!pbcopy<cr>
  vmap <C-c> :w !pbcopy<cr><cr>
endif
