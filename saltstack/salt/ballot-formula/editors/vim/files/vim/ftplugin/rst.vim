"
" reStructuredText language settings
"

"number lines
setlocal nu

"uniform indent (spaces)
setlocal expandtab

"indent width
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal autoindent

"use folding
setlocal nofoldenable
setlocal foldmethod=indent

"tip to create section heading
let @h = "yypVr"

"quick preview
command! -b Pandoc
	\ | execute ':silent !pandoc -s -f rst % > /tmp/vim-rst.html && x-www-browser /tmp/vim-rst.html'
	\ | execute ':redraw!'

setlocal textwidth=80
