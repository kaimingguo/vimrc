# Vim Configuration Files

![](https://img.shields.io/badge/License-BSD%202--Clause-blue.svg?style=flat-square "BSD 2-Clause")

VimL: Opinionated Vim configuration

## Vim Requirements

The distribution is designed to work with Vim >= 8.1 (neovim >= 0.3.8).

This also requires `curl`, [git](https://git-scm.com), `ruby` support.

## Plugins Requirements

I manage plugins with [vim-plug](https://github.com/junegunn/vim-plug), which is pretty easy to install.
All plugins settings are defined in the `plug_plugins` folder.

- [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be installed.
- [vimwiki](https://github.com/vimwiki/vimwiki) Convert vimwiki to html requires `pandoc` to be installed.
- [fzf](https://github.com/junegunn/fzf.vim) Requires [ripgrep](https://github.com/BurntSushi/ripgrep), or [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) to be installed.
- FZF, tagbar, and vim-gutentags Required [Universal Ctags](https://ctags.io/) to be installed.
- [youcompleteme](https://github.com/Valloric/YouCompleteMe) make sure you have Vim 7.4+ with Python 2 or Python 3 support. Requires `CMake` and `LLVM` to build this.

## Configuration

You can overwrite default configuration and key bindings by using one of
following files in `core` folder:

- **generate.vim** Regular configuration
- **mapping.vim** Mappings key configuration

## Fonts

Use the [IBM Plex](https://github.com/IBM/plex) typeface.

[IBM Plex Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/IBMPlexMono/Mono/complete)
in GUI (like MacVim) font, it using in vim-devicons.

## Custom Plugins

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

## Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) key use `,`,
so when ever you see `<leader>` it meas `,` key.

> In document when ever you see `<ctrl>`, `<shift>`, and `<alt>` it meas keyboard \[CTRL\], \[SHIFT\]
> , and \[ALT\] key.

### Regular Mappings

| Key Bindings   | Mode          | Description                                                                |
| -------------- | ------------- | -------------------------------------------------------------------------- |
| `*`            | Normal        | Searches for the current selection word                                    |
| `[<>]`         | Visual        | Shifting indent                                                            |
| J              | Visual        | The selected move next row down                                            |
| K              | Visual        | Paragraph up                                                               |
| U              | Normal        | Remap `<ctrl>r` redo                                                       |
| `g[oO]`        | Normal        | Begin a new line below/above the cursor without entering                   |
| `gy`           | Normal        | Yanking entire buffer                                                      |
| `vy`           | Normal        | Select entire buffer                                                       |
| `s=`           | Normal        | Equal size windows                                                         |
| `sx`           | Normal        | Swap windows                                                               |
| `<esc>`        | Terminal      | Exited terminal                                                            |
| `<ctrl>j`      | Normal        | Move to split below                                                        |
| `<ctrl>k`      | Normal        | Move to upper split                                                        |
| `<ctrl>h`      | Normal        | Move to left split                                                         |
| `<ctrl>l`      | Normal        | Move to right split                                                        |
| `<ctrl>p`      | Command       | Inserts the path of the currently edited file                              |
| `<ctrl>a`      | Command       | Move the insertion point to the beginning                                  |
| `<ctrl>e`      | Command       | Move the insertion point to the end                                        |
| `<shift>j`     | Normal        | Move cursor to previous buffer                                             |
| `<shift>k`     | Normal        | Move cursor to next buffer                                                 |
| `<shift>h`     | Normal        | Move cursor to previous tab                                                |
| `<shift>l`     | Normal        | Move cursor to next tab                                                    |
| `<shift>b`     | Normal        | Opens an edit command                                                      |
| `<shift>t`     | Normal        | Opens a tabedit command                                                    |
| `<leader>h`    | Normal        | Highlight search word under cursor without jump to next                    |
| `<leader>.`    | Normal        | Set working directory                                                      |
| `<leader>be`   | Normal        | Opens an edit command with the path of the currently edited file filled in |
| `<leader>te`   | Normal        | Opens a tab edit command with the path of the currently edited file filled |
| `<leader>bx`   | Normal        | Close current buffer                                                       |
| `<leader>tx`   | Normal        | Close current tab                                                          |
| `<leader>ss`   | Normal        | Split window horizontally and switch to the new split                      |
| `<leader>sv`   | Normal        | Split window vertically and switch to the new split                        |
| `<leader>sh`   | Normal        | Open terminal emulator                                                     |

### Plugins Mappings

#### Vimwiki

Normal mode:

- `<leader>ww`: Open default wiki index page.
- `<leader>wt`: Open default wiki index page in a new tab.
- `<leader>wd`: Delete current wiki page.
- `<leader>wr`: Rename current wiki page.
- `<enter>`: In vimwiki file, follow/create wiki link.
- `<backspace>`: In vimwiki file, go back to parent (previous) wiki link.
- `<tab>`: In vimwiki file, find next wiki link.

For more keys, see `:h vimwiki-mappings` or [vimwiki-readme](http://github.com/vimwiki/vimwiki#key-bindings)

### Incsearch

Key Mapping:

- `/`: highlights **ALL** pattern and forward match.
- `?`: highlights **ALL** pattern and backward match.
- `g/`: highlights **ALL** pattern matches.

Normal:

- `<esc><esc>`: Disable highlight search word.

### NerdTree

- `<F2>`: Toggle NERDTree split window.

### Tagbar

- `<F3>`: Toggle tagbar split window.

### Fzf

Normal:

- `<leader>ff`: Open currently path files list.
- `<leader>bb`: Open all open buffers list.

Insert Mode:

- `<ctrl>x<ctrl>k`: Open word list.

## Commands

### Plugins Commands

#### Vimwiki

- `:Vimwiki2HTML`: Convert current wiki link to HTML.
- `:VimwikiAll2HTML`: Convert all wiki links to HTML.

#### Fugitive

- `:Git`: Bring up a summary window vaguely akin to git-status.
- `:Gwrite`: Write to the current file's path and stage the results.
- `:Gdiffsplit!`: Diff against any and all direct ancestors, retaining focus on the current window.

For more information, see `:help fugitive`.

#### NerdTree (NerdTree-Tabs)

- `:NerdTreeTabsOpen`: Switches NERDTree on for all tabs.
- `:NerdTreeTabsClose`: Switches NERDTree off for all tabs.

For more information, see [nerdtree-tabs-key-mappings](https://github.com/jistr/vim-nerdtree-tabs#commands-and-mappings).

#### vim-codefmt

- `:FormatCode`: Format code style.

## Plugin List

<!-- prettier-ignore-start -->
<!-- PLUGIN_LIST_BEGIN -->
| Plugin | Description |
| ------ | ----------- |
| [YCM-Generator](https://github.com/rdnetto/YCM-Generator) [:gear:](./plug_plugins/YCM-Generator.vim) | Generates config files for [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) |
| [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) [:gear:](./plug_plugins/YouCompleteMe.vim) | A code-completion engine for Vim |
| [c.vim](https://github.com/vim-scripts/c.vim) [:gear:](./plug_plugins/c.vim) | C/C++ IDE -- Write and run programs. Insert statements, idioms, comments etc |
| [fzf.vim](https://github.com/junegunn/fzf.vim) [:gear:](./plug_plugins/fzf.vim) | fzf ❤️ vim|
| [incsearch.vim](https://github.com/haya14busa/incsearch.vim) [:gear:](./plug_plugins/incsearch.vim) | 🔦 Improved incremental searching for Vim |
| [molokai](https://github.com/tomasr/molokai) [:gear:](./plug_plugins/molokai.vim) | Molokai color scheme for Vim |
| [nerdtree](https://github.com/vim-nerdtree/nerdtree) [:gear:](./plug_plugins/nerdtree.vim) | A tree explorer plugin for vim. |
| [syntastic](https://github.com/vim-syntastic/syntastic) [:gear:](./plug_plugins/syntastic.vim) | Syntax checking hacks for vim |
| [tagbar](https://github.com/majutsushi/tagbar) [:gear:](./plug_plugins/tagbar.vim) | Vim plugin that displays tags in a window, ordered by scope |
| [vim-airline](https://github.com/vim-airline/vim-airline) [:gear:](./plug_plugins/vim-airline.vim) | Lean & mean status/tabline for vim that's light as air |
| [vim-codefmt](https://github.com/google/vim-codefmt) [:gear:](./plug_plugins/vim-codefmt.vim) | codefmt is a utility for syntax-aware code formatting |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) [:gear:](./plug_plugins/vim-fugitive.vim) | fugitive.vim: A Git wrapper so awesome, it should be illegal |
| [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) [:gear:](./plug_plugins/vim-gutentags.vim) | A Vim plugin that manages your tag files |
| [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight) [:gear:](./plug_plugins/vim-nerdtree-syntax-highlight.vim) | Extra syntax and highlight for nerdtree files |
| [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs) [:gear:](./plug_plugins/vim-nerdtree-tabs.vim) | NERDTree and tabs together in Vim, painlessly |
| [vim-polyglot](https://github.com/sheerun/vim-polyglot) [:gear:](./plug_plugins/vim-polyglot.vim) | A solid language pack for Vim. |
| [vim-signify](https://github.com/mhinz/vim-signify) [:gear:](./plug_plugins/vim-signify.vim) | :heavy_plus_sign: Show a diff using Vim its sign column. |
| [vimwiki](https://github.com/vimwiki/vimwiki) [:gear:](./plug_plugins/vimwiki.vim) | Personal Wiki for Vim |
<!-- PLUGIN_LIST_END -->
<!-- prettier-ignore-end -->

## See Also

- [amix/vimrc](https://github.com/amix/vimrc) The ultimate Vim configuration: vimrc
- [mutewinter/dot_vim](https://github.com/mutewinter/dot_vim) 🐉 The Vim Configuration of Champions.
  Uses Vundle to manage roughly four thousand plugins. The dragon symbolizes complexity.
- [Vim Bootstrap](https://vim-bootstrap.com) A generator which provides a simple method of generating
  a .vimrc configuration for vim

## License

Use of this source code is governed by a BSD 2-Clause license that can be
found in the [LICENSE](./LICENSE) file.

<!--
References Link
-->

<!--
Plugins Link
-->

<!--
[//]: <> vim: set nofoldenable ft=markdown :
-->
