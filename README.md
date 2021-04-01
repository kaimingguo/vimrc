# Vim Configuration Files

![](https://img.shields.io/badge/License-BSD%202--Clause-blue.svg?style=flat-square "BSD 2-Clause")

VimL: Opinionated Vim configuration

## Vim Requirements

### Options

- `toml`, `PyGithub` for generate `README.md` plugin list use

## Plugins Requirements

- `pandoc` - vimwiki convert to HTML

## Custom Setting

You can create `.vimrc_profile` in `$HOME` direcotry. follow:

```sh
# Render multiple values for multiple column layout concerns
$ echo 'let g:rulers = [80,100]' > $HOME/.vimrc_profile
```

## Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) key use `,`,
so when ever you see `<leader>` it meas `,` key.

> In document when ever you see `<ctrl>`, `<shift>`, and `<alt>` it meas keyboard \[CTRL\], \[SHIFT\]
> , and \[ALT\] key.

### Regular Mappings

| Key Bindings     | Mode     | Description                                                  |
| ---------------- | -------- | ------------------------------------------------------------ |
| `gy`             | Normal   | Yank entire buffer                                           |
| `vy`             | Normal   | Select entire buffer                                         |
| `Y`              | Normal   | Copy the current line                                        |
| `U`              | Normal   | Redo, easier map `<ctrl> r`                                  |
| `<enter>`        | Normal   | Disable highlight                                            |
| `t`              | Normal   | Close new tab                                                |
| `<leader> sh`    | Normal   | Open terminal emulator                                       |
| `gT` or `J`      | Normal   | Go one tab left                                              |
| `gt` or `K`      | Normal   | Go one tab right                                             |
| `q`              | Normal   | Close the currently tab                                      |
| `<ctrl> j/k/l/h` | Normal   | Move between window                                          |
| `<leader> ss`    | Normal   | Horizontal split and switch to the new split                 |
| `<leader> sv`    | Normal   | Vertical split and switch to the new split                   |
| `go`             | Normal   | Create newline below the cursor without entering insert mode |
| `gO`             | Normal   | Create newline above the cursor without entering insert mode |
| `>`              | Visual   | Increase indent text after the cursor                        |
| `<`              | Visual   | Decrease indent text after the cursor                        |
| `J`              | Visual   | Move a line below the cursor                                 |
| `K`              | Visual   | Move a line above the cursor                                 |
| `<esc>`          | Terminal | Exit terminal mode                                           |
| `<ctrl> p`       | Command  | Inserts the path of the currently edited file into a command |

#### Insert Current Datestamp

Type `dts` in insert mode to expand to datastamp:

```
> dts<space> or dts<enter>
-- replace to --
03/30/2021 11:24:12 CST
```

## Plugin List

Use `tools/gen_readme_plugins.py` load from `rc/{dein,dein_lazy}.toml` and
generate list into `README.md`:

```bash
# Install toml, and PyGithub dependences
$ pip install -r requirements.txt
$ GITHUB_TOKEN=XXX ./tools/gen_readme_plugins.py
```

<!-- prettier-ignore-start -->
<!-- BEGIN PLUGIN LIST -->
### Non-Lazy Plugin List
| Plugin | Description |
| ------ | ----------- |
| [dein.vim](https://github.com/Shougo/dein.vim) | :zap: Dark powered Vim/Neovim plugin manager |
| [vim-polyglot](https://github.com/sheerun/vim-polyglot) | A solid language pack for Vim. |
| [vim-colors-xcode](https://github.com/arzg/vim-colors-xcode) | Xcode 11’s dark and light colourschemes, now for Vim! |
### Lazy Plugin List
| Plugin | Description |
| ------ | ----------- |
| [vimwiki](https://github.com/vimwiki/vimwiki) | Personal Wiki for Vim |
<!-- END PLUGIN LIST -->
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
[//]: <> vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab filetype=markdown :
[//]: <> vim: set nofoldenable :
-->
