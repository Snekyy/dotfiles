" Powerline
let g:powerline_pycmd="py3"
set laststatus=2   " Last window always has a statusline


filetype plugin indent on
filetype indent on
syntax enable		" Highlight syntax

set encoding=utf-8  " Unicode
set ignorecase		" Ignore case when searching
set noshowmode		" Disable showmode to default bottom bar
set wrap			" Handle long lines
set autoindent		" Apply the indentation of the current line to the next line

set list			" Show hidden characters
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set tabstop=4		" Tab spacing
set smarttab		" Use tabs at the start of a line(spaces elsewhere)

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

set background=dark
colorscheme gruvbox

" .rasi syntax
au BufNewFile,BufRead /*.rasi setf css
