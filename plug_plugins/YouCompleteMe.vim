" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


""
" @private
" Build you-complete-me
" info is a dictionary with 3 fields
" - name:   name of the plugin
" - status: 'installed', 'updated', or 'unchanged'
" - force:  set on PlugInstall! or PlugUpdate!
function! BuildYcmd(info) abort
  if a:info.status =~ 'installed' || a:info.force
    !./install.py
  endif
endfunction

if exists('g:plug_installing_plugins')
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYcmd') }
  finish
endif

let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0

let g:syntastic_cpp_checkers = ['clang_tidy']

let g:ycm_filetype_specific_completion_to_disable = {
  \ 'ruby': 1,
  \ 'javascript': 1,
  \ 'jsx': 1 }

let g:ycm_semantic_triggers =  {
  \ 'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go': ['.'],
  \ 'ruby': ['.', '::'],
  \ 'gitcommit': ['#', ':'] }


" Overwritten so we can allow markdown completion.
let g:ycm_filetype_blacklist = {
  \ 'notes': 1,
  \ 'unite': 1,
  \ 'tagbar': 1,
  \ 'pandoc': 1,
  \ 'qf': 1,
  \ 'vimwiki': 1,
  \ 'text': 1,
  \ 'infolog': 1,
  \ 'mail': 1 }
