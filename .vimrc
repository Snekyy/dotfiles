" powerline
let g:powerline_pycmd="py3"
set laststatus=2
set rtp+=/usr/share/powerline/bindings/vim

syntax on          " highlight syntax

set noerrorbells   " no beeps
set encoding=utf-8 " Unicode
set noswapfile     " Dont create swap files
set nobackup       " Don't create annoying backup files

" Lines enumeration/Set color to numbers of lines
"set nu
"highlight LineNr ctermfg=black

set ignorecase     " Ignore case when searching
set smartcase      " When searching try to be smart about cases

" Display hidden characters(different)/Set characters to them
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set noshowmode     " Disable showmode to default bottom bar
set wrap           " Handle long lines
set autoindent     " Apply the indentation of the current line to the next line
set smartindent

"set whichwrap=b,s,<,>,[,]
set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set noexpandtab
"set undodir=~/.vim/undodir
"set undofile
"set ttymouse=sgr

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

set background=dark
colorscheme gruvbox

" Open empty files in insert mode
"autocmd BufNewFile * startinsert
"autocmd VimEnter * if empty(expand("%")) | startinsert | endif
"autocmd VimEnter * if getfsize(expand("%")) == 0 | startinsert | endif

set paste
