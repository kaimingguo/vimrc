#!/usr/bin/env csh -f

set syntax = "$2"
set ext = "$3"
set outdir = "$4"
set input = "$5"
set styles = "$6"
set tpl_path = "$7"
set tpl_default = "$8"
set tpl_ext = "$9"
if ( "$10" =~ -* ) then
	set root_path = ''
else
	set root_path = "$10"
endif

set fname = `basename "$input" ."$ext"`
set tpl = "$tpl_path/$tpl_default$tpl_ext"
set output = "$outdir$fname.html"

if ( { grep -oq '$$.*$$' $5 >/dev/null } ) then
	set math = '--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
else
	set math = ''
endif

sed -E 's/[^\(!\)](\[.+\])\(([^#)]+)\)/\1(\2.html)/g' < "$input" | \
	pandoc "$math" --template="$tpl" -f "$syntax" -t html -c "$styles:t" -M root_path:"$root_path" > $output
