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

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic', { 'for': 'rust' }

" the most expensive plugin
Plug 'Valloric/YouCompleteMe', { 'for': 'rust', 'do': './install.py --racer-completer' }

call plug#end()


" color scheme
syntax enable
colorscheme molokai
set encoding=utf-8


" vim-gitgutter
set updatetime=250

" airline
set laststatus=2
let g:airline_powerline_fonts = 1

" indentLine
let g:indentLine_enabled = 0
"let g:indentLine_char = '│'
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2

" Goyo
let g:goyo_width = '60%'
let g:goyo_height = '80%'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_loc_list_height=4
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']



" custom commands
map gd :YcmCompleter GoToDefinition<CR>
map <leader>gd :YcmCompleter GetDoc<CR>

map nt :NERDTreeToggle<CR>

map <F2> :NERDTreeFind<CR> <c-w><c-p>

