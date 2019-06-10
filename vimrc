set nocp

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'leafgarland/typescript-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'jason0x43/vim-js-indent'
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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeShowHidden = 1

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
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='simple'

" Javascript
let g:javascript_plugin_jsdoc = 1

" fzf
set rtp+=/usr/local/bin/fzf
