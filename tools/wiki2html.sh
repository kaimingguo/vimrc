#!/bin/sh
# Copyright (c) 2019-present Kaiming Guo. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.
#
# Idea from:
# https://gist.github.com/maikeldotuk/54a91c21ed9623705fdce7bab2989742
# https://gist.github.com/enpassant/0496e3db19e32e110edca03647c36541

type pandoc >/dev/null 2>&1
if [ "$?" -ne 0 ]; then
  exit 1
fi

readonly mathjax="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

syntax="$2"
extension="$3"
out_dir="$4"
input="$5"
styles="$6"
tpl_path="$7"
tpl_default="$8"
tpl_ext="$9"
root_path="${10}"

fname=$(basename "$input" ."$extension")
tpl="$tpl_path/$tpl_default$tpl_ext"
output="$out_dir/$fname.html"
css=$(basename "$styles")

[[ "$root_path" = "-" ]] && root_path=''
if [[ -n $(grep -o "\$\$.\+\$\$" "$input") ]]; then
  math="--mathjax=$mathjax"
else
  math="--mathjax="
fi

sed -E 's/[^\(!\)](\[.+\])\(([^#)]+)\)/\1(\2.html)/g' < "$input" | \
  pandoc "$math" --template="$tpl" -f "$syntax" -t html -c "$css" -M root_path:"$root_path" > $output

# vim: set sw=2 ts=2 et ft=sh :
