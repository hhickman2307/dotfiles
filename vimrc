set nocompatible

set noswapfile
set autoread

"256 Colors
set t_Co=256

" make backspace work like most other apps
set backspace=2

"Syntax Highlighting
syntax on

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

" Persistent undo
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
"YouCompleteMe
"Scratch
"Ctrlp
"Tagbar
"Tabular

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))

" Use the guicolorscheme plugin to makes 256-color or 88-color
" terminal use GUI colors rather than cterm colors.
  runtime! plugin/guicolorscheme.vim
  "GuiColorScheme revolution
  colorscheme twilight
  "colorscheme vividchalk
else
" For 8-color 16-color terminals or for gvim, just use the
" regular :colorscheme command.
  colorscheme default
endif

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
