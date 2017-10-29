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
set lazyredraw

" check file change every 4 seconds ('CursorHold')
" and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" enable mouse support
" set mouse=a

" stop fcking cursor blinking in Neovim
set guicursor=a:block-blinkon1

" specify plugin directory
let plugin_dir = $HOME . '/.vim/plugins/'


call plug#begin(plugin_dir)

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
Plug 'vim-syntastic/syntastic', { 'for': ['rust', 'python'] }

if has('nvim')
	Plug 'zchee/deoplete-jedi',				{ 'for': 'python' }
	Plug 'sebastianmarkow/deoplete-rust',	{ 'for': 'rust' }
	Plug 'Shougo/deoplete.nvim',			{ 'do': ':UpdateRemotePlugins' }
else
	Plug 'Valloric/YouCompleteMe', { 'for': ['rust', 'python'], 'do': './install.py --racer-completer' }
endif

call plug#end()


" color scheme
syntax enable
set encoding=utf-8
if isdirectory(plugin_dir . 'molokai')
	colorscheme molokai
endif


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
if isdirectory(plugin_dir . 'syntastic')
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
endif
let g:syntastic_loc_list_height=4
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete-Rust
let g:deoplete#sources#rust#racer_binary = $HOME . '/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH

" NERDTree
map nt   :NERDTreeToggle<CR>
map <F2> :NERDTreeFind<CR> <c-w><c-p>

" FZF
let g:fzf_history_dir = '~/.fzf_history'
map fzf  :FZF<CR>
map fzt  :Tags<CR>
map fzb  :BTags<CR>
map fzc  :Commits<CR>
map ;    :Buffers<CR>

" custom commands
if has('nvim')
	autocmd Filetype rust			map gd :DeopleteRustGoToDefinitionDefaut<CR>
else
									map gd <c-]>
	autocmd Filetype python,rust	map gd :YcmCompleter GoToDefinition<CR>
endif

