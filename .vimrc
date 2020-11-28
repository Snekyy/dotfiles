call plug#begin('~/.vim/plugged')

Plug 'artanikin/vim-synthwave84'

call plug#end()

filetype on
filetype indent on
filetype indent plugin on

syntax enable
set background=dark
se t_Co=256
"colorscheme synthwave84

" Пронумеровка строк
set number

" Поддержка мыши
"set mouse=a

" Кодировка
set encoding=utf-8

" Перенос на новую строку при перемещениями стрелочками
set whichwrap=b,s,<,>,[,]

" Проверка орфографии
"set spell
"set spelllang=ru

set guiheadroom=0

" Fixes mouse issues using Alacritty terminal emulator
set ttymouse=sgr
