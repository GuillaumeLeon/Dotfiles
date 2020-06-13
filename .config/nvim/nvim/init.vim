" MAP LEADER 

let mapleader = " " 
set encoding=utf-8
set fileencoding=utf-8
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

" ###########
" # Plugins #
" ###########

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle
" Install:
"  git clone https://github.com/VundleVim/Vundle.vim.git
"  ~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')

"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/mattn/emmet-vim'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/itchyny/lightline.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'https://github.com/lilydjwg/colorizer'
Plugin 'tpope/vim-commentary'
Plugin 'voldikss/vim-floaterm'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tmsvg/pear-tree'
Plugin 'morhetz/gruvbox'

call vundle#end()         
filetype plugin indent on 

inoremap <F3> <Esc>:vsp && i<CR>

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
set guifont =Hack

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
