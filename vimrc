set nocompatible

set noswapfile

"256 Colors
set t_Co=256

" Keybindings
" nnoremap j h
" nnoremap i k
" nnoremap k j
" nnoremap o i

" make backspace work like most other apps
set backspace=2

"Syntax Highlighting
syntax on

"Adding the 80 character column marker
set colorcolumn=80

"Auto read when file is changed externally
set autoread

"Better command-line completion
set wildmenu

"Show partial commands above status line
set showcmd

"Autoindentation
set autoindent

"Always display status line
set laststatus=2

"Line numbers
set number

"Underline
set cursorline

"Persistent undo
set undodir=$HOME/.vim/undo
set undofile
set undolevels=10000
set undoreload=100000

"Tab Indentation options
set shiftwidth=4
set softtabstop=4
set expandtab

"Plugins
execute pathogen#infect()
"let g:airline_theme='raven'
let g:airline_theme='laederon'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.branch = ''

"Plugin List
"Pathogen as plugin manager
"vim-airline
"vim-fugitive
"YouCompleteMe - DISABLED
"PythonMode - DISABLED
"Scratch
"Ctrlp
"Tagbar
"Tabular
"Easymotion
"Nerdtree
"Jedi
"Pyflakes

colorscheme twilight
" colorscheme vividchalk
" colorscheme feral

" Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Tagbar - Toggle the window with F8, go to it with F9
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpen fc<CR>

" Automatic unfolding
set foldlevel=99

" YouCompleteMe
set wildmode=list,list
set completeopt=menu
let g:jedi#popup_select_first = 0
let g:ycm_min_num_identifier_candidate_chars = 3

" Easymotion
"map <Leader> <Plug>(easymotion-prefix) <Space>
let mapleader = "\<Space>"

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Jedi
" let g:jedi#completions_command = "<Tab>"

" Pyflakes
autocmd BufWritePost *.py call Flake8() " Automatically run on write
let g:flake8_show_in_gutter = 1 " Display marks in left column
