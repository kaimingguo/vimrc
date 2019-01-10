" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


" Set extra options when running in GUI mode
if has('gui_running')
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
  set tm=500
  set mouse=a
endif

if has('mac') || has('macunix')
  if has('gui_running')
    if has('gui_mac') || has('gui_macvim')
      set guifont=Hack\ Nerd\ Font\ Mono:h12
      set transparency=7
    endif

    set guioptions=egmrt

    " Use option (alt) as meta key
    set macmeta
  endif
endif
