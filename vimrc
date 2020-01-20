scriptencoding utf-8

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin()

" === UI === "
" Themes
Plug 'drewtempelmeyer/palenight.vim'
" File tree
Plug 'scrooloose/nerdtree'
" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" === Languages Plugins === "
Plug 'sheerun/vim-polyglot'

" === Editing Plugins === "
" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CtrlP - Fuzzy finding, buffer management
Plug 'ctrlpvim/ctrlp.vim'
" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Surround editing
Plug 'tpope/vim-surround'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()


" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

set nocp
" Don't show last command
set noshowcmd
" Yank and paste with the system clipboard
set clipboard=unnamedplus
" Insert spaces when TAB is pressed.
set expandtab
" only one line for command line
set cmdheight=1
" a tab is four spaces
set tabstop=4
" number of spaces to use for autoindenting
set shiftwidth=4
" set show matching parenthesis
set showmatch
" === Completion Settings === "
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
imap <leader>s <Plug>(neosnippet_expand_or_jump)
smap <leader>s <Plug>(neosnippet_expand_or_jump)
xmap <leader>s <Plug>(neosnippet_expand_target)
" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.vim/snippets'
" Hide conceal markers
let g:neosnippet#enable_conceal_markers = 0

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1
" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1
" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" === Vim airline ==== "
try
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1
" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'
" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''
" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '❮'
let g:airline_right_sep = '❯'
catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0


" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" Vim airline theme
let g:airline_theme='onedark'

" Set preview window to appear at bottom
set splitbelow
" Don't dispay mode in command line (airilne already shows it)
set noshowmode
" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b
" Customize NERDTree directory
hi! NERDTreeCWD guifg=#99c794

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" === Search === "
" ignore case when searching
set ignorecase
" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase
" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number
set relativenumber
                        
set undolevels=1000      " use many muchos levels of undo
set visualbell           " don't beep
set noerrorbells         " don't beep

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
" Splitting configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" === coc.nvim === "
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ci <Plug>(coc-implementation)

" color scheme
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1
