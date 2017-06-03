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

" check file change every 4 seconds ('CursorHold')
" and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" enable mouse support
"set mouse=a


call plug#begin('~/.vim/plugins')

Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'cespare/vim-toml'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe', { 'for': 'rust', 'do': './install.py --racer-completer' }

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
let g:indentLine_enabled = 0
"let g:indentLine_char = '│'
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2


" Goyo
let g:goyo_width = '60%'
let g:goyo_height = '80%'



" custom commands
map gd :YcmCompleter GoToDefinition<CR>
map <leader>gd :YcmCompleter GetDoc<CR>

map nt :NERDTreeToggle<CR>

map <F2> :NERDTreeFind<CR> <c-w><c-p>



" check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

" Call NERDTreeFind iff:
"   1. NERDTree is active;
"   2. current window contains a modifiable file
"   3. we're not in vimdiff
"function! SyncTree()
"  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

