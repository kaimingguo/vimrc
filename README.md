# Vim Configuration Files

[![license][badge-license]][license]

VimL: Opinionated Vim configuration

## Vim Requirements

This is a distribution of vim plugins and resources for Vim.

- [fugitive.vim][vim-fugitive-gh] requires [Git][git] to be installed
- [fzf.vim][fzf-vim-gh] requires [The Silver Searcher][the-silver-searcher] to be installed
- [ctags.vim][ctags-vim-gh] requires [Universal Ctags][universal-ctags] to be installed
- [jedi-vim][jedi-vim-gh] requires [jedi][jedi] to be installed
- [editorconfig.vim][editorconfig-vim-gh] requires [EditorConfig][editorconfig] to be installed
- [vim-go][vim-go-gh] requires `golang` to be installed
- [youcompleteme][youcompleteme-gh] make sure you have Vim 7.4+ with Python 2 or Python 3 support. requires `CMake` and `LLVM` to build this.

### Plugins

I manage plugins with [vim-plug][vim-plug], which is pretty easy to install.
All plugins settings are defined in the `plug_plugins` folder.

#### vim-codefmt

Use `google-java-executable` to format `java` filetype, add this to `config/_local.vim`:

```
try
  Glaive codefmt plugin[mappings]
  Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
catch
endtry
```

##### Autoformatting

Want to just sit back and let autoformat happen automatically? Add this to `config/_local.vim`:

```
if has('autocmd')
  augroup autoformat_settings
    autocmd!

    autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
    autocmd FileType javascript AutoFormatBuffer prettier
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
  augroup END
endif
```

#### Custom Plugins

Create a new `.vim` file with the same name as the plugin you'd like to install
in `plug_plugins/custom`. Then add the installation block. Follow:

```sh
# Add vim-devicons plugin
touch plug_plugins/custom/vim-devicons.vim
```

```vim
" vim-devicons.vim
if exists('g:plug_installing_plugins')
  Plug 'ryanoasis/vim-devicons'
  finish
endif

"
" You can define plugin config here
"
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPlugForceVAlign = ''
```

### Fonts

[Hack][hack-font] has deep roots in the libre, open source typeface community
and includes the contributions of the Bitstream Vera & DejaVu projects.

[Hack Regular Nerd Font Complete][nerd-fonts-hack] in GUI (like MacVim) font,
it using in vim-devicons.

## Configuration

You can overwrite default configuration and key bindings by using one of
following files in `config` folder:

- **autocmd.vim** Auto commands configuration file
- **basic.vim** Regular configuration
- **function.vim** Define function file
- **mapping.vim** Mappings key configuration
- **platform.vim** The OS platforms define file
- **\_local.vim** Configuration for your own user only

## Mappings

The [leader][vim-leader] key use `,`, so when ever you see `<leader>` it meas
`,` key.

### Unmapped

- Remove press `^` move to first non-whitespace character of line
- Remove press `$` move to end of line

### Regular Mappings

| Key Bindings   | Mode          | Description                                                                |
| -------------- | ------------- | -------------------------------------------------------------------------- |
| H              | Normal/Visual | Move cursor to beginning of line                                           |
| L              | Normal/Visual | Move cursor to end of line                                                 |
| \*             | Normal        | Searches for the current selection word                                    |
| \>/\<          | Visual        | Shifting indent                                                            |
| J              | Visual        | The selected move next row down                                            |
| K              | Visual        | Paragraph up                                                               |
| g o            | Normal        | Begin a new line below the cursor without entering                         |
| g O            | Normal        | Begin a new above the cursor without entering                              |
| g y            | Normal        | Yanking entire buffer                                                      |
| v y            | Normal        | Select entire buffer                                                       |
| s =            | Normal        | Equal size windows                                                         |
| s x            | Normal        | Swap windows                                                               |
| Ctrl-j         | Normal        | Move to split below                                                        |
| Ctrl-k         | Normal        | Move to upper split                                                        |
| Ctrl-h         | Normal        | Move to left split                                                         |
| Ctrl-l         | Normal        | Move to right split                                                        |
| Ctrl-p         | Command       | Inserts the path of the currently edited file                              |
| \<leader\> h   | Normal        | Highlight search word under cursor without jump to next                    |
| \<leader\> /   | Normal        | Disable highlight search word                                              |
| \<leader\> .   | Normal        | Set working directory                                                      |
| \<leader\> e   | Normal        | Opens an edit command with the path of the currently edited file filled in |
| \<leader\> t e | Normal        | Opens a tab edit command with the path of the currently edited file filled |
| \<leader\> s s | Normal        | Split window horizontally and switch to the new split                      |
| \<leader\> s v | Normal        | Split window vertically and switch to the new split                        |
| \<leader\> s h | Normal        | Open terminal emulator                                                     |
| \<leader\> b p | Normal        | Move to previous buffer                                                    |
| \<leader\> b n | Normal        | Move to next buffer                                                        |
| \<leader\> b x | Normal        | Close current buffer                                                       |
| \<leader\> b w | Normal        | Create new buffer in command line                                          |

### Plugins Mappings

| Plugins                               | Key Bindings     | Mode   | Description                                                |
| ------------------------------------- | ---------------- | ------ | ---------------------------------------------------------- |
| [ctrlp.vim][ctrlp-vim-gh]             | \<leader\> ,     | Normal | Open MRU list to split below                               |
| [vim-grepper][vim-grepper-gh]         | \<leader\> a g   | Normal | Start `grepper` into command line                          |
| [vim-side-search][vim-side-search-gh] | \<leader\> a s   | Normal | Start `side search` into command line                      |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> a f   | Normal | Start `ag` into command line                               |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> f f   | Normal | Get currently path file list on split below                |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> b b   | Normal | List opened buffer list on split below                     |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> g f   | Normal | Get file list with in Git repository                       |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> g m   | Normal | Get file list with ignore in repository                    |
| [fzf.vim][fzf-vim-gh]                 | \<leader\> b l   | Normal | Get currently edited buffer all line                       |
| [fzf.vim][fzf-vim-gh]                 | Ctrl-x Ctrl-k    | Insert | Display complete word on left split                        |
| [fzf.vim][fzf-vim-gh]                 | Ctrl-x Ctrl-f    | Insert | Get complete path                                          |
| [fzf.vim][fzf-vim-gh]                 | Ctrl-x Ctrl-j    | Insert | Get file `ag`                                              |
| [fzf.vim][fzf-vim-gh]                 | Ctrl-x Ctrl-l    | Insert | Get currently buffer line                                  |
| [incsearch.vim][incsearch-vim-gh]     | z /              | Normal | Start fuzzy motion search into command line                |
| [incsearch.vim][incsearch-vim-gh]     | /                |        | Go to forward search                                       |
| [incsearch.vim][incsearch-vim-gh]     | ?                |        | Go to backward search                                      |
| [incsearch.vim][incsearch-vim-gh]     | g /              |        | Stay incsearch                                             |
| [nerdtree][nerdtree-gh]               | \<F2\>           | Normal | Toggle nerd tree explorer                                  |
| [tagbar][tagbar-gh]                   | \<F3\>           | Normal | Toggle tag explorer                                        |
| [undotree][undotree-gh]               | \<F4\>           | Normal | Toggle undo tree explorer                                  |
| [vim-easymotion][vim-easymotion-gh]   | \<space\>        | Normal | Start easy motion, input `<space>{char}{label}` jump to it |
| [vim-easymotion][vim-easymotion-gh]   | \<leader\> j     | Normal | Line motions with line below the cursor                    |
| [vim-easymotion][vim-easymotion-gh]   | \<leader\> k     | Normal | Line motions with above the cursor                         |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g a   | Normal | Execute `git add` on current file                          |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g c   | Normal | `git commit` (splits window to write commit message)       |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g s h | Normal | `git push`                                                 |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g l l | Normal | `git pull`                                                 |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g s   | Normal | `git status`                                               |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g d   | Normal | `git diff`                                                 |
| [fugitive.vim][vim-fugitive-gh]       | \<leader\> g r   | Normal | `git remove`                                               |

## Plugin List

| Plugin                                          | Description                                                                  | Category     |
| ----------------------------------------------- | ---------------------------------------------------------------------------- | ------------ |
| [Join][join-gh]                                 | better (hopefully) :Join command in vim                                      | Commands     |
| [YCM-Generator][ycm-generator-gh]               | Generates config files for [YouCompleteMe][youcompleteme-gh]                 | Commands     |
| [YouCompleteMe][youcompleteme-gh]               | A code-completion engine for Vim                                             | Completion   |
| [auto-pairs][auto-pairs-gh]                     | Vim plugin, insert or delete brackets, parens, quotes in pair                | Other        |
| [c.vim][c-vim-gh]                               | C/C++ IDE -- Write and run programs. Insert statements, idioms, comments etc | Language     |
| [ctags.vim][ctags-vim-gh]                       | Display function name in the title bar                                       | Interface    |
| [ctrlp.vim][ctrlp-vim-gh]                       | Fuzzy file, buffer, mru, tag, etc finder                                     | Interface    |
| [editorconfig.vim][editorconfig-vim-gh]         | [EditorConfig][editorconfig] plugin for Vim                                  | Other        |
| [fzf.vim][fzf-vim-gh]                           | fzf ❤️ vim                                                                   | Interface    |
| [incsearch.vim][incsearch-vim-gh]               | 🔦 Improved incremental searching for Vim                                    | Commands     |
| [jedi-vim][jedi-vim-gh]                         | Using the jedi autocompletion library for VIM                                | Code display |
| [nerdtree][nerdtree-gh]                         | A tree explorer plugin for vim                                               | Commands     |
| [nord-vim][nord-vim-gh]                         | An arctic, north-bluish clean and elegant Vim theme                          | Code display |
| [requirements.txt.vim][requirements-txt-vim-gh] | the Requirements File Format syntax support for Vim                          | Code display |
| [syntastic][vim-syntastic-gh]                   | Syntax checking hacks for vim                                                | Language     |
| [tagbar][tagbar-gh]                             | Vim plugin that displays tags in a window, ordered by scope                  | Interface    |
| [UltiSnips][ultisnips-gh]                       | The ultimate snippet solution for Vim                                        | Completion   |
| [undotree][undotree-gh]                         | The ultimate undo history visualizer for VIM                                 | Interface    |
| [abolish.vim][vim-abolish-gh]                   | easily search for, substitute, and abbreviate multiple variants of a word    | Commands     |
| [vim-airline][vim-airline-gh]                   | Lean & mean status/tabline for vim that's light as air                       | Interface    |
| [vim-codefmt][vim-codefmt-gh]                   | codefmt is a utility for syntax-aware code formatting                        | Commands     |
| [commentary.vim][vim-commentary-gh]             | comment stuff out                                                            | Interface    |
| [EasyMotion][vim-easymotion-gh]                 | Vim motions on speed!                                                        | Commands     |
| [fugitive.vim][vim-fugitive-gh]                 | A Git wrapper so awesome, it should be illegal                               | Integrations |
| [vim-go][vim-go-gh]                             | Go development plugin for Vim                                                | Language     |
| [vim-grepper][vim-grepper-gh]                   | 👾 Helps you win at grep                                                     | Integrations |
| [vim-gutentags][vim-gutentags-gh]               | A Vim plugin that manages your tag files                                     | Other        |
| [Indent Guides][vim-indent-guides-gh]           | A Vim plugin for visually displaying indent levels in code                   | Code display |
| [vim-javascript][vim-javascript-gh]             | Vastly improved Javascript indentation and syntax support in Vim             | Language     |
| [vim-markdown][vim-markdown-gh]                 | Markdown Vim Mode                                                            | Language     |
| [vim-misc][vim-misc-gh]                         | Miscellaneous auto-load Vim scripts                                          | Other        |
| [numbertoggle][vim-numbertoggle-gh]             | Toggles between hybrid and absolute line numbers automatically               | Interface    |
| [vim-polyglot][vim-polyglot-gh]                 | A solid language pack for Vim                                                | Language     |
| [vim-session][vim-session-gh]                   | Extended session management for Vim (:mksession on steroids)                 | Commands     |
| [vim-side-search][vim-side-search-gh]           | Search context in Vim in a sidebar using `ag` output                         | Commands     |
| [vim-signify][vim-signify-gh]                   | ➕ Show a diff using Vim its sign ccolumn                                    | Integrations |
| [surround.vim][vim-surround-gh]                 | quoting/parenthesizing made simple                                           | Code display |
| [vimproc.vim][vimproc-vim-gh]                   | Interactive command execution in Vim                                         | Commands     |
| [vimshell.vim][vimshell-vim-gh]                 | 🐚 Powerful shell implemented by vim                                         | Commands     |

## See Also

- [amix/vimrc][amix-vimrc-gh] The ultimate Vim configuration: vimrc
- [mutewinter/dot_vim][mutewinter-dot_vim-gh] 🐉 The Vim Configuration of Champions. Uses Vundle to manage roughly four thousand plugins. The dragon symbolizes complexity.
- [Vim Bootstrap][vim-bootstrap] A generator which provides a simple method of generating a .vimrc configuration for vim

## License

Use of this source code is governed by a BSD 2-Clause license that can be
found in the [LICENSE][license] file.

<!--
References Link
-->

[badge-license]: https://img.shields.io/badge/License-BSD%202--Clause-blue.svg?style=flat-square "BSD 2-Clause"
[git]: https://git-scm.com "Git"
[editorconfig]: http://editorconfig.org "EditorConfig"
[the-silver-searcher]: https://github.com/ggreer/the_silver_searcher "The Silver Searcher"
[universal-ctags]: https://ctags.io "Universal Ctags"
[jedi]: http://github.com/davidhalter/jedi "jedi"
[vim-plug]: https://github.com/junegunn/vim-plug "vim-plug"
[hack-font]: https://sourcefoundry.org/hack/ "Hack"
[nerd-fonts-hack]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Regular/complete "Hack Regular Nerd Font Complete"
[vim-leader]: http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader "Leader"
[license]: https://github.com/kaimingguo/vimrc/blob/master/LICENSE "license"
[vim-bootstrap]: https://vim-bootstrap.com "Vim Bootstrap"
[amix-vimrc-gh]: https://github.com/amix/vimrc "vimrc"
[mutewinter-dot_vim-gh]: https://github.com/mutewinter/dot_vim "dot_vim"

<!--
Plugins Link
-->

[join-gh]: https://github.com/sk1418/join "Join"
[auto-pairs-gh]: https://github.com/jiangmiao/auto-pairs "auto-pairs"
[c-vim-gh]: https://github.com/vim-scripts/c.vim "c.vim"
[ctags-vim-gh]: https://github.com/vim-scripts/ctags.vim "ctags.vim"
[ctrlp-vim-gh]: https://github.com/ctrlpvim/ctrlp.vim "ctrlp.vim"
[editorconfig-vim-gh]: https://github.com/editorconfig/editorconfig-vim "editorconfig.vim"
[fzf-vim-gh]: https://github.com/junegunn/fzf.vim "fzf.vim"
[incsearch-vim-gh]: https://github.com/haya14busa/incsearch.vim "incsearch.vim"
[jedi-vim-gh]: https://github.com/davidhalter/jedi-vim "jedi-vim"
[nerdtree-gh]: https://github.com/scrooloose/nerdtree "nerdtree"
[nord-vim-gh]: https://github.com/arcticicestudio/nord-vim "nord-vim"
[requirements-txt-vim-gh]: https://github.com/raimon49/requirements.txt.vim "requirements.txt.vim"
[tagbar-gh]: https://github.com/majutsushi/tagbar "tagbar"
[undotree-gh]: https://github.com/mbbill/undotree "undotree"
[vim-abolish-gh]: https://github.com/tpope/vim-abolish "abolish.vim"
[vim-codefmt-gh]: https://github.com/google/vim-codefmt "vim-codefmt"
[vim-commentary-gh]: https://github.com/tpope/vim-commentary "commentary.vim"
[vim-easymotion-gh]: https://github.com/easymotion/vim-easymotion "EasyMotion"
[vim-fugitive-gh]: https://github.com/tpope/vim-fugitive "fugitive.vim"
[vim-go-gh]: https://github.com/fatih/vim-go "vim-go"
[vim-grepper-gh]: https://github.com/mhinz/vim-grepper "vim-grepper"
[vim-gutentags-gh]: https://github.com/ludovicchabant/vim-gutentags "Gutentags"
[vim-indent-guides-gh]: https://github.com/nathanaelkane/vim-indent-guides "Indent Guides"
[vim-javascript-gh]: https://github.com/pangloss/vim-javascript "vim-javascript"
[vim-markdown-gh]: https://github.com/plasticboy/vim-markdown "vim-markdown"
[vim-misc-gh]: https://github.com/xolox/vim-misc "vim-misc"
[vim-numbertoggle-gh]: https://github.com/jeffkreeftmeijer/vim-numbertoggle "numbertoggle"
[vim-polyglot-gh]: https://github.com/sheerun/vim-polyglot "vim-polyglot"
[vim-session-gh]: https://github.com/xolox/vim-session "Extended session management for Vim"
[vim-side-search-gh]: https://github.com/ddrscott/vim-side-search "vim-side-search"
[vim-signify-gh]: https://github.com/mhinz/vim-signify "signify"
[vim-surround-gh]: https://github.com/tpope/vim-surround "surround.vim"
[vimproc-vim-gh]: https://github.com/shougo/vimproc.vim "vimproc.vim"
[vimshell-vim-gh]: https://github.com/shougo/vimshell.vim "vimshell.vim"
[vim-syntastic-gh]: https://github.com/vim-syntastic/syntastic "syntastic"
[vim-airline-gh]: https://github.com/vim-airline/vim-airline "vim-airline"
[youcompleteme-gh]: https://github.com/Valloric/YouCompleteMe "YouCompleteMe"
[ycm-generator-gh]: https://github.com/rdnetto/YCM-Generator "YCM-Generator"
[ultisnips-gh]: https://github.com/SirVer/ultisnips "ultisnips"
