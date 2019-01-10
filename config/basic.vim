" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


"
" ---------------------------------------------------------------------------
" _. General {{{

" Sets how many lines of history Vim has to remember
set history=500

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
if has('vim_starting')
  " Set compatibility to Vim only
  if &compatible | set nocompatible | endif
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" Set to auto read when a file is change from the outside
set autoread

" }}}

" ---------------------------------------------------------------------------
" _. Vim User Interface {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
set langmenu=en
exec 'source ' . $VIMRUNTIME . '/delmenu.vim'
exec 'source ' . $VIMRUNTIME . '/menu.vim'

" Better command-line completion
set wildmenu

" Ignore compiled files
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Display line numbers on the left
set number

" Always display the status line, even if only one window is displayed
set laststatus=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Vim loves to redraw the screen during things it probably doesn't need
" to--like in the middle of macros. This tells Vim not to bother redrawing
" during these scenarios, leading to faster macros
set lazyredraw

" For regular expressions turn magic on
set magic

" With `showmatch`, when your cursor moves over a parenthesis-like
" character, the matching one will be highlighted as well
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=5

" No annoying sound on errors
set noerrorbells visualbell t_vb=

" Color the 80th column differently as a wrapping guide
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" }}}

" ---------------------------------------------------------------------------
" _. Colors and Fonts {{{

" Enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Force 256 color mode if available
if $TERM =~ '-256color'
  set t_Co=256
  set t_ut=
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" }}}

" ---------------------------------------------------------------------------
" _. Files and Backups {{{

" Double // causes backups to use full file path
exec 'set backupdir=' . g:vimdir . '/.backup//'
exec 'set directory=' . g:vimdir . '/.tmp//'

" Turn on backups
set backup

" }}}

" ---------------------------------------------------------------------------
" _. Text, Tab and Indent Related {{{

" Yanks go on clipboard instead
if has('clipboard')
  if has('unnamedplus')
    " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else
    " On macOS and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Linebreak on 500 characters
set linebreak
set textwidth=500

" Use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" Auto-indent spaces with C in Vim
set autoindent
set cindent

" }}}

" ---------------------------------------------------------------------------
" _. Moving Around, Tabs and Buffers {{{

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" }}}

" ---------------------------------------------------------------------------
" _. Status Line {{{

" Set the command window height to 2 lines, to avoid many cases of having to
" `press <Enter> to continue`
set cmdheight=2

" Default status line format
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

" }}}

" ---------------------------------------------------------------------------
" _. Status Line {{{

" Enable mouse
set mouse=a
if has('neovim')
  if has('mouse_sgr')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

" Hide when characters are typed
set mousehide

" }}}
