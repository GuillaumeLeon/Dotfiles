" MAP LEADER 
let mapleader = " " 

syntax on

" Set Things
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
set relativenumber
set ruler 
set ttyfast
set noeb vb t_vb=
set noswapfile
set linebreak 
set shell=/bin/bash 
set guifont =Hack\ Nerd\ Font\ 12
set background=dark

" ###########
" # Plugins #
" ###########

" set the runtime path to include Vundle and initialize
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-commentary'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'noahfrederick/vim-laravel'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'yuezk/vim-js'
Plug 'udalov/kotlin-vim'

call plug#end()

filetype plugin indent on 

noremap <F3> :vsp <CR>
noremap <F2> :sp <CR>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabnext<cr> 
map <leader>tb :tabprevious<cr> 
map <leader>ff :Telescope find_files<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>q :NERDTreeToggle<cr>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automaticly close nerd tree if it's the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
autocmd Filetype php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.blade.php set ft=blade

"######################
"#  theme and colors  #
"######################

" colorscheme palenight
colorscheme gruvbox

" let things
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.DS_Store$', '.git$', 'Cargo.lock']
let g:coc_disable_startup_warning = 1
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


lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "vendor"} } }
EOF
