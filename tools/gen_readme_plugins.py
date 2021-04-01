#!/usr/bin/env python
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

from __future__ import print_function

import sys
import os
import re

from github import Github
import toml

__version__ = '0.1.0'

BEGIN_COMMENTS = r"<!--\ BEGIN\ PLUGIN\ LIST\ -->"
END_COMMENTS = r"<!--\ END\ PLUGIN\ LIST\ -->"

TABLE_HEADER = [
    '| Plugin | Description |',
    '| ------ | ----------- |',
]


def main(args):
    token = os.getenv('GITHUB_TOKEN')
    g = Github(token)

    rc = toml.load('rc/dein.toml')
    rc_lazy = toml.load('rc/dein_lazy.toml')

    plugin_list = []
    lazy_plugin_list = []
    out_text = []

    try:
        for p in rc['plugins']:
            repo = g.get_repo(p['repo'])
            line = r'| [{}]({}) | {} |'.format(repo.name, repo.html_url,
                                               repo.description)
            plugin_list.append(line)
    except KeyError:
        print('not found plugins')

    try:
        for p in rc_lazy['plugins']:
            repo = g.get_repo(p['repo'])
            line = r'| [{}]({}) | {} |'.format(repo.name, repo.html_url,
                                               repo.description)
            lazy_plugin_list.append(line)
    except KeyError:
        print('not found plugins')

    out_text.append(r'<!-- BEGIN PLUGIN LIST -->')
    if plugin_list:
        out_text.append('### Non-Lazy Plugin List')
        out_text += TABLE_HEADER
        for line in plugin_list:
            out_text.append(line)

    if lazy_plugin_list:
        out_text.append('### Lazy Plugin List')
        out_text += TABLE_HEADER
        for line in lazy_plugin_list:
            out_text.append(line)
    out_text.append(r'<!-- END PLUGIN LIST -->')

    fulltext = "\n".join(out_text)
    with open('README.md') as f:
        text = f.read()

    t = re.sub(r'{}(.|\s|\n)*?{}'.format(BEGIN_COMMENTS, END_COMMENTS),
               fulltext, text)
    with open('README.md', 'w') as f:
        f.write(t)
    return 0


if __name__ == '__main__':
    try:
        sys.exit(main(sys.argv[1:]))
    except KeyboardInterrupt:
        sys.stderr.write('interrupted\n')
        sys.exit(1)

# vim: set tabstop=4 softtabstop=4 shiftwidth=4 expandtab filetype=python :
