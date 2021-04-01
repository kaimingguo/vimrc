<!DOCTYPE html>
<html$if(lang)$ lang="$lang$"$endif$$if(dir)$ dir="$dir$"$endif$>
<head>
  <meta charset="$if(charset)$$charset$$else$utf-8$endif$">
  <meta name="generator" content="pandoc">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$if(title-prefix)$$title-prefix$ – $endif$$pagetitle$</title>

$for(author-meta)$
  <meta name="author" content="$author-meta$">
$endfor$
$if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$">
$endif$
$if(keywords)$
  <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$">
$endif$
$if(description)$
  <meta name="description" content="$description$">
$endif$

  <style>
$if(quotes)$
    q { quotes: "“" "”" "‘" "’"; }
$endif$
$if(highlighting-css)$
    $highlighting-css$
$endif$
  </style>
$for(css)$
  <link rel="stylesheet" href="$root_path$$css$">
$endfor$
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>
  <![endif]-->
$for(header-includes)$
  $header-includes$
$endfor$
</head>
<body>
<article class="markdown-body">
$for(include-before)$
  $include-before$
$endfor$
$if(title)$
  <header id="title-block-header">
    <h1 class="title$if(subtitle)$ followed-by-subtitle$endif$">$title$</h1>
  $if(subtitle)$
    <p class="subtitle">$subtitle$</p>
  $endif$
  $if(author)$
    <p class="author">$author$</p>
  $endif$
  $if(date)$
    <p class="date">$date$</p>
  $endif$
  $if(summary)$
    <div class="summary">$summary$</div>
  $endif$
  </header>
$endif$
$if(toc)$
  <nav id="$idprefix$TOC" role="doc-toc">
    <h1 class="toc-title">$if(toc-title)$$toc-title$$else$Contents$endif$</h1>
    $table-of-contents$
  </nav>
$endif$
  $body$
$for(include-after)$
  $include-after$
$endfor$
</article>
$if(math)$
  $math$
$endif$
</body>
</html>
