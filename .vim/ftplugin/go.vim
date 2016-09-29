"
" Go language settings
"
"number lines
setlocal number

"highlight chars who exceed 80 columns
if version < 730
	match ErrorMsg '\%>80v.\+'
else
	set colorcolumn=80
endif

"uniform indent (spaces)
setlocal expandtab

"indent settings
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal autoindent
setlocal smartindent

"use folding
setlocal foldenable
setlocal foldmethod=indent

"complete options
setlocal omnifunc=syntaxcomplete#Complete
setlocal completeopt=menuone,longest

"let <ctrl-n> handle completion
inoremap <C-n> <C-x><C-o>

"customize color operators
syn match Special  /\(*\|+\|\/\)/

