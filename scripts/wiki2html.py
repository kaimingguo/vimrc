#!/usr/bin/env python
# Copyright 2020 Kaiming Guo. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
"""Convert vimwiki (markdown) to HTML.

Reference:
https://github.com/vimwiki/vimwiki/issues/642#issuecomment-477815553
"""

from os import path
import re
import shutil
import subprocess
import sys

MATH_JAX_URL = 'https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'


def get_title(lines, def_value):
    match = re.search(
        r'^(?:---|\.\.\.)$\n.*^title: ([^\n]+)$\n.*^(?:---|\.\.\.)$',
        lines,
        re.MULTILINE | re.DOTALL,
    )
    return match.group(1) if match else def_value


def repl(match):
    link = path.splitext(match.group(2))[0] + ".html"
    return '[{}]({})'.format(match.group(1), link)


def main(force, syntax, extension, out_path, in_file, css, tmp_path, tmp_fname,
         tmp_ext, root_path, other_args) -> int:
    if shutil.which('pandoc') is None:
        sys.stderr.write('pandoc: Command not found.\n')
        return 1

    if syntax != 'markdown':
        sys.stderr.write('Unsupported syntax.\n')
        return 1

    styles = path.basename(css)
    in_fname = path.splitext(path.basename(in_file))[0]
    with open(in_file, 'r', encoding='utf8') as f:
        lines = f.read()

    out_fname = path.join(out_path, in_fname) + path.extsep + "html"
    template = path.join(tmp_path, tmp_fname) + tmp_ext
    title = get_title(lines, in_fname.title())
    lines = re.sub(r'\[([^]]+)\]\((.+)\)', repl, lines)
    has_math = re.search(r'(\$+)(?:(?!\1)[\s\S])*\1', lines,
                         re.MULTILINE | re.DOTALL)

    tool = 'pandoc'
    args = [
        '--mathjax={}'.format(MATH_JAX_URL) if has_math else '',
        '--section-divs',
        '--template={}'.format(template) if path.isfile(template) else '',
        '-s',
        '--highlight-style=pygments',
        '--metadata',
        'pagetitle={}'.format(title),
        other_args if other_args != '-' else '',
        '-c',
        styles,
        '-f',
        'markdown',
        '-t',
        'html',
        '-o',
        out_fname,
        '-',
    ]

    # prune empty elements from command list
    args = list(filter(None, args))
    return subprocess.run([tool] + args,
                          check=True,
                          encoding='utf8',
                          input=lines)


if __name__ == '__main__':
    try:
        sys.exit(main(*sys.argv[1:]))
    except KeyboardInterrupt:
        sys.stderr.write('interrupted\n')
        sys.exit(1)

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab filetype=python :
