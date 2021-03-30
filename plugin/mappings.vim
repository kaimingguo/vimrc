" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

""
" Yank entire buffer.
execute 'nnoremap gy :0,$ y<CR>'

""
" Select entire buffer.
execute 'nnoremap vy ggVG'

""
" Copy the current line like other capital commands.
" Hat-tip http://vimbits.com/bits/11
execute 'nnoremap Y y$'

""
" Open terminal emulator
execute 'nnoremap <silent> sh :terminal<cr>'

""
" Smart way to move between window
execute 'noremap <C-j> <C-w>j'
execute 'noremap <C-k> <C-w>k'
execute 'noremap <C-l> <C-w>l'
execute 'noremap <C-h> <C-w>h'

""
" Create newlines without entering insert mode
execute 'nnoremap go o<esc>k'
execute 'nnoremap gO O<esc>j'

""
" Remap 'U' to 'CTRL-r' for easier redo, from: http://vimbits.com/bits/356
execute 'nnoremap U <C-r>'

""
" Do not move on *
execute 'nnoremap <silent> * :let star_view=winsaveview()<CR>*:call winrestview(star_view)<CR>'

""
" Disable highlight when 'ENTER' is pressed
execute 'nnoremap <ENTER> <nop>'
execute 'nnoremap <silent> <ENTER> :nohls<CR>'

""
" Split window vertically or horizontally and switch to the new split
execute 'nnoremap <silent> <leader>ss :split<BAR>:wincmd j<CR>:wincmd =<CR>'
execute 'nnoremap <silent> <leader>sv :vsplit<BAR>:wincmd l<CR>:wincmd =<CR>'

""
" Shifting '>' and '<' in visual mode, cursor stays still
execute 'vnoremap > >gv'
execute 'vnoremap < <gv'

""
" Move visual block
execute "vnoremap J :m '>+1<cr>gv=gv'"
execute "vnoremap K :m '<-2<cr>gv=gv'"

""
" press `[CTRL-\_CTRL-n]` key or map <esc> key to exit terminal mode
" From: https://github.com/Shougo/deol.nvim
execute 'tnoremap <esc> <C-\><C-n>'

""
" Create new tab
execute 'nnoremap t :tabnew<space>'
execute 'nnoremap <silent> <S-j> :tabprevious<CR>'
execute 'nnoremap <silent> <S-k> :tabnext<CR>'
execute 'nnoremap <silent> q :tabclose<CR>'

""
" Inserts the path of the currently edited file into a command.
execute "cnoremap <C-p> <C-r>=expand('%:p:h').'/'<CR>"

""
" Type 'dts' in insert mode to expand to datastamp.
"
" > dts<space> || dts<esc>
" -- replace to --
" 01/07/2021 17:57:04 CST
"
" Reference: https://vim.fandom.com/wiki/insert_current_date_or_time
iabbrev dts <C-R>=strftime('%x %H:%M:%S %Z')<CR>

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set ts=2 sts=2 sw=2 et tw=78 ft=vim foldenable foldmethod=marker :
