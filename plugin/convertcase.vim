vim9script

if exists('g:loaded_convertcase')
  finish
endif
g:loaded_convertcase = 1

import autoload 'convertcase.vim'

command! ToSnake  convertcase.To('snake')
command! ToUpper  convertcase.To('upper')
command! ToPascal convertcase.To('pascal')
command! ToCamel  convertcase.To('camel')
