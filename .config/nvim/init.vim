" MAP LEADER 
let mapleader = " " 

set encoding=UTF-8
set fileencoding=UTF-8
set mouse=a
set textwidth=80
set termguicolors
set hlsearch
set path+=**
set smartindent
set autoindent 
set shiftwidth=4  
set softtabstop=4
syntax on
set relativenumber
set ruler 
set ttyfast
set noeb vb t_vb=
set noswapfile
set linebreak 
set shell=/bin/bash 

" ###########
" # Plugins #
" ###########

" set the runtime path to include Vundle and initialize
call plug#begin(stdpath('data') . '/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'StanAngeloff/php.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'

call plug#end()
filetype plugin indent on 

noremap <F3> :vsp <CR>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabmove<cr> 
map <leader>ff :FZF<cr>

map <leader>nn :NERDTreeToggle<cr>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1

let NERDTreeIgnore = ['\.DS_Store$', '.git$', 'Cargo.lock']

"######################
"#  theme and colors  #
"######################

set background=dark

" colorscheme palenight
colorscheme gruvbox

set guifont =Hack\ Nerd\ Font\ 12

" Display Git branch in status bar
let g:lightline = {
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	    \ },
	    \ 'component_function': {
	    \   'gitbranch': 'gitbranch#name'
	    \ },
	    \ }
let g:coc_disable_startup_warning = 1
