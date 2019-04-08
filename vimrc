set nocp
execute pathogen#infect()
execute pathogen#helptags()
call plug#begin()
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()
syntax on
filetype plugin indent on
set clipboard=unnamedplus

" color scheme
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1
"colorscheme molokai

" Set line numbers
set number

" NERDTree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1

" Splitting configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Python
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 125
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_complete_on_dot = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

" Javascript
let g:javascript_plugin_jsdoc = 1
