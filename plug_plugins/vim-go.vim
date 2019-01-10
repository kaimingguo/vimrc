" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


if exists('g:plug_installing_plugins')
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  finish
endif

let g:go_list_type = 'quickfix'
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

""
" @private
" Run :GoBuild or :GoTestCompile based on the go file.
function! s:BuildGoFiles() abort
  let l:file = expand('%')
  if l:file =~# '^\f\_+test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

if has('autocmd')
  augroup vimrc_go_settings
    autocmd!
    if v:version >= 703 || v:version == 703 && has('patch598')
      autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview'
        \ | silent! pclose | endif
    endif

    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

    autocmd FileType go nmap <leader>dd <plug>(go-def-vertical)
    autocmd FileType go nmap <leader>dv <plug>(go-doc-vertical)
    autocmd FileType go nmap <leader>db <plug>(go-doc-browser)

    autocmd FileType go nmap <leader>r  <plug>(go-run)
    autocmd FileType go nmap <leader>t  <plug>(go-test)
    autocmd FileType go nmap <leader>gt <plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>i <plug>(go-info)
    autocmd FileType go nmap <silent> <leader>l <plug>(go-metalinter)
    autocmd FileType go nmap <C-g> :GoDecls<cr>
    autocmd FileType go nmap <leader>dr :GoDeclsDir<cr>
    autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
    autocmd FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
    autocmd FileType go nmap <leader>rb :<C-u>call <sid>BuildGoFiles()<cr>
  augroup END
endif
