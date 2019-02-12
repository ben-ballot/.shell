"
" Markdown language settings
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

"quick preview
if has("gui_running")
	command! -b Pandoc
		\ | execute ':silent !pandoc -s -f markdown % > /tmp/vim-md.html && links2 -g /tmp/vim-md.html &'
		\ | execute ':redraw!'
else
	command! -b Pandoc
		\ | execute ':silent !pandoc -s -f markdown % > /tmp/vim-md.html && links2 /tmp/vim-md.html'
		\ | execute ':redraw!'
endif
