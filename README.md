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
| `<leader>/`    | Normal        | Disable highlight search word                                              |
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

## Plugin List

<!-- prettier-ignore-start -->
<!-- PLUGIN_LIST_BEGIN -->
| Plugin | Description |
| ------ | ----------- |
| [lightline.vim](https://github.com/itchyny/lightline.vim) [:gear:](./plug_plugins/lightline.vim) | A light and configurable statusline/tabline plugin for Vim |
| [molokai](https://github.com/tomasr/molokai) [:gear:](./plug_plugins/molokai.vim) | Molokai color scheme for Vim |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) [:gear:](./plug_plugins/vim-fugitive.vim) | fugitive.vim: A Git wrapper so awesome, it should be illegal |
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
