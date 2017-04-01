set nu

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB

set smartindent

set hlsearch
set cursorline



call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --racer-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" vim-gitgutter
set updatetime=250

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" color scheme
syntax enable
colorscheme molokai
set encoding=utf-8

" indentLine
" let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2


" custom commands
:command Gtd YcmCompleter GoToDefinition
