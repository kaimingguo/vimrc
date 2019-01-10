" Copyright (c) 2019 Kai-Ming Guo. All rights reserved.
" Use of this source code is governed by a BSD-style license that can be
" found in the LICENSE file.


for file in split(glob(g:vimdir . '/plug_plugins/*.vim'), "\n")
  exe 'source' fnameescape(file)
endfor
for file in split(glob(g:vimdir . '/plug_plugins/custom/*.vim'), "\n")
  exe 'source' fnameescape(file)
endfor
