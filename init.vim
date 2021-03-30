" Copyright (c) 2019-present Kaiming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.

" set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
if has('vim_starting')
  " vint: -ProhibitSetNoCompatible
  " set compatiblity to vim only
  if &compatible | set nocompatible | endif
  " vint: +ProhibitSetNoCompatible
endif

" include user's environment
if filereadable(expand('$HOME/.vimrc_profile'))
  execute 'source' fnameescape(expand('$HOME/.vimrc_profile'))
endif

" initialize base requirements
if !has('g:mapleader')
  " use [,] as leader required before loading plugins
  let mapleader=','
  let g:mapleader=','
endif

let $VIM_PATH =
  \ get(g:, 'vim_path',
  \   !empty($VIM_PATH) ? expand($VIM_PATH) :
  \   exists('*stdpath') ? stdpath('config') :
  \   fnamemodify(resolve(expand('<sfile>:p')), ':h')
  \ )

let g:cache_path =
  \ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '$HOME/.cache'))

if !isdirectory(expand(g:cache_path))
  call mkdir(expand(g:cache_path), 'p')
endif

if &runtimepath !~# expand($VIM_PATH)
  execute 'set runtimepath^=' . $VIM_PATH
endif

" Text Editor {{{1

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set fileformats=unix,dos,mac

" 'colorcolumn' is a comma separated list of screen columns that are
" highlighted with ColorColumn |hl-ColorColumn|.  Useful to align text.
" Will make screen redrawing slower.
if exists('+colorcolumn') && exists('g:ruler')
  execute 'set colorcolumn=' . join(g:ruler, ',')
endif

" When non-zero, a column with the specified width is shown at the side of
" the window which indicates open and closed folds.  The maximum value is 12.
set foldcolumn=1

" Enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  " When this option is set, the syntax with this name is loaded, unless
  " syntax highlighting has been switched off with ":syntax off".
  syntax enable
endif

" Force 256 color mode if available
if $TERM =~ '-256color'
  set t_Co=256
  set t_ut=
endif

" When set to "dark", Vim will try to use colors that look good on a
" dark background.  When set to "light", Vim will try to use colors that
" look good on a light background.  Any other value is illegal.
set background=light

" }}}

" Workbench {{{1

" A history of ":" commands, and a history of previous search patterns
" are remembered.  This option decides how many entries may be stored in
" each of these histories (see |cmdline-editing|).
set history=64

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=7

" Print the line number in front of each line.
set number

try
  " This option controls the behavior when switching between buffers.
  " Possible values (comma separated list):
  "    useopen	If included, jump to the first open window that
  "	            contains the specified buffer (if there is one).
  "	            Otherwise: Do not examine other windows.
  "	            This setting is checked with |quickfix| commands, when
  "	            jumping to errors (":cc", ":cn", "cp", etc.).  It is
  "	            also used in all buffer related split commands, for
  "	            example ":sbuffer", ":sbnext", or ":sbrewind".
  "    usetab	  Like "useopen", but also consider windows in other tab
  "	            pages.
  "    split	  If included, split the current window before loading
  "	            a buffer.  Otherwise: do not split, use current window.
  "	            Supported in |quickfix| commands that display errors.
  "    newtab	  Like "split", but open a new tab page.  Overrules
  "	            "split" when both are present.
  set switchbuf=useopen,usetab,newtab

  " The value of this option specifies when the line with tab page labels
  "	will be displayed:
  "		0: never
  "		1: only if there are at least two tab pages
  "		2: always
  " This is both for the GUI and non-GUI implementation of the tab pages
  " line.
  set showtabline=2
catch
endtry

" The value of this option influences when the last window will have a
"	status line:
"		0: never
"		1: only if there are at least two windows
"		2: always
"	The screen looks nicer with a status line if you have several
"	windows, but it takes another screen line. |status-line|
set laststatus=2

" Number of screen lines to use for the command-line.  Helps avoiding
" |hit-enter| prompts.
set cmdheight=2

" When nonempty, this option determines the content of the status line.
"	Also see |status-line|.
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

" yanks go on clipboard instead
if has('clipboard')
  if has('unnamedplus')
    " when possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else
    " on macOS and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" }}}

" Window {{{1

" English to use for menu translation.
execute 'source' . $VIMRUNTIME . '/delmenu.vim'
set langmenu=en
execute 'source' . $VIMRUNTIME . '/menu.vim'

" Set extra options when running in GUI mode
if has('gui_running')
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" }}}

" Features {{{1

" When 'wildmenu' is on, command-line completion operates in an enhanced
"	mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
"	the possible matches are shown just above the command line, with the
"	first match highlighted (overwriting the status line, if there is one).
set wildmenu

" A list of file patterns.  A file that matches with one of these
"	patterns is ignored when completing file or directory names, and
"	influences the result of |expand()|, |glob()| and |globpath()| unless
"	a flag is passed to disable this.
"	The pattern is used like with |:autocmd|, see |autocmd-patterns|.
"	Also see 'suffixes'.
"
"	Example:
"	  :set wildignore=*.o,*.obj
"
" The use of |:set+=| and |:set-=| is preferred when adding or removing
"	a pattern from the list.  This avoids problems when a future version
"	uses another default.
set wildignore=*.o,*.obj

" When off a buffer is unloaded when it is |abandon|ed.  When on a
"	buffer becomes hidden when it is |abandon|ed.  If the buffer is still
"	displayed in another window, it does not become hidden, of course.
"	The commands that move through the buffer list sometimes make a buffer
"	hidden although the 'hidden' option is off: When the buffer is
"	modified, 'autowrite' is off or writing is not possible, and the '!'
"	flag was used.  See also |windows.txt|.
"	To only make one buffer hidden use the 'bufhidden' option.
"	This option is set for one command with ":hide {command}" |:hide|.
"	WARNING: It's easy to forget that you have changes in hidden buffers.
"	Think twice when using ":q!" or ":qa!".
set hidden

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
"	mode.  This is a list of items, separated by commas.  Each item allows
"	a way to backspace over something:
"
"	  value	  effect	
"	  indent	allow backspacing over autoindent
"	  eol	    allow backspacing over line breaks (join lines)
"	  start	  allow backspacing over the start of insert; CTRL-W and CTRL-U
"	          stop once at the start of insert.
"
"	When the value is empty, Vi compatible backspacing is used.
set backspace=eol,start,indent

" Allow specified keys that move the cursor left/right to move to the
"	previous/next line when the cursor is on the first/last character in
"	the line.  Concatenate characters to allow this for these keys:
"
"		char   key	  mode	
"		 b    <BS>	 Normal and Visual
"		 s    <Space>	 Normal and Visual
"		 h    "h"	 Normal and Visual (not recommended
"		 l    "l"	 Normal and Visual (not recommended)
"		 <    <Left>	 Normal and Visual
"		 >    <Right>	 Normal and Visual
"		 ~    "~"	 Normal
"		 [    <Left>	 Insert and Replace
"		 ]    <Right>	 Insert and Replace
"
"	Example:
"		:set ww=<,>,[,]
"
" allows wrap only when cursor keys are used.
set whichwrap+=<,>,h,l

" Ignore case in search patterns.  Also used when searching in the tags file.
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case
" characters.  Only used when the search pattern is typed and 'ignorecase'
" option is on.  Used for the commands "/", "?", "n", "N", ":g" and ":s".
" Not used for "*", "#", "gd", tag search, etc..  After "*" and "#" you can
" make 'smartcase' used by doing a "/" command, recalling the search pattern
" from history and hitting <Enter>.
"	NOTE: This option is reset when 'compatible' is set.
set smartcase

" When there is a previous search pattern, highlight all its matches. The type
" of highlighting used can be set with the 'l' occasion in the 'highlight'
" option.  This uses the "Search" highlight group by default.  Note that only
" the matching text is highlighted, any offsets are not applied.
set hlsearch

" When this option is set, the screen will not be redrawn while executing
" macros, registers and other commands that have not been typed.  Also,
" updating the window title is postponed.  To force an update use |:redraw|.
set lazyredraw

" Changes the special characters that can be used in search patterns.
" See |pattern|.
set magic

" When a bracket is inserted, briefly jump to the matching one.  The jump is
" only done if the match can be seen on the screen.  The time to show the
" match can be set with 'matchtime'.
set showmatch

" Tenths of a second to show the matching paren, when 'showmatch' is set.
set matchtime=5

" Disable ring the bell (beep or screen flash) for error messages.
set noerrorbells visualbell t_vb=

" The time in milliseconds that is waited for a key code or mapped key
"	sequence to complete.  Also used for CTRL-\ CTRL-N and CTRL-\ CTRL-G
"	when part of a command has been typed.
set nottimeout ttimeout ttimeoutlen=200

" enable mouse in normal/visual mode only
set mouse=nv

" hiden when characters are typed
set mousehide

if has('*mouse_sgr')
  set ttymouse=sgr
endif

" }}}

" load plugin
execute 'source' fnameescape(expand($VIM_PATH).'/rc/dein.vim')

" vim: set ts=2 sts=2 sw=2 et tw=78 ft=vim foldenable foldmethod=marker :
