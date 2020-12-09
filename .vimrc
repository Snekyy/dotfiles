" powerline
let g:powerline_pycmd="py3"
set laststatus=2
set rtp+=/usr/share/powerline/bindings/vim

syntax on

"set nu
" set nowrap
set encoding=utf-8
set whichwrap=b,s,<,>,[,]
set guiheadroom=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set noswapfile
set noerrorbells
set undodir=~/.vim/undodir
set undofile
set ttymouse=sgr

set colorcolumn=80
highlight ColorColumn ctermbg=1 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'https://github.com/Badacadabra/vim-archery'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'

call plug#end()

set background=dark
let g:hybrid_transparent_background = 1
let g:enable_bold_font = 1
colorscheme gruvbox
