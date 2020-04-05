" ##################
" # General option #
" ##################

" ############
" # Encoding #
" ############

" Buffer encoding in UTF-8
set encoding=utf-8

" File encoding in UTF-8
set fileencoding=utf-8

" ##############
" # Vim Option #
" ##############

" Mouse
set mouse=a

" max size of a row
set textwidth=80

set termguicolors

" highlighted search
set hlsearch

" Path
set path+=**

" Auto indentation
set smartindent
set autoindent 

" Indentation of 3 space
set shiftwidth=3  

" tab = 3 space
set softtabstop=3

" Syntax highlighting
syntax on

" Line number
set relativenumber
"set number

" Show the cursor position
set ruler 

" Quicker scrolling
set ttyfast

" No system sound
set noeb vb t_vb=

" No .swp file
set noswapfile

" Cut the line after a word only
set linebreak 

"###################
"# Folding setting #
"###################

set foldmethod=indent
set foldlevelstart=2

let php_folding=1             " PHP

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
Plugin 'jiangmiao/auto-pairs'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'joonty/vim-phpqa.git'
Plugin 'https://github.com/lilydjwg/colorizer'
Plugin 'mcchrish/nnn.vim'
Plugin 'tpope/vim-commentary'

call vundle#end()         
filetype plugin indent on 

"#########
"#  NNN  #
"#########

"let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

"##############
"#  shortcut  #
"##############

" Insert mod
inoremap <F3> <Esc>:vsp && i<CR>

" Normal mod
noremap <F3> :vsp <CR>

" Bypass the readonly mod 
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"#############
"# NerdTree  #
"#############

" Automatically open NERDTREE at vim start
autocmd vimenter * NERDTree

" Automatically closing vim if the nerdtree tab is the last one 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1

"Ignoring file 
let NERDTreeIgnore = ['\.DS_Store$', '.git$', 'Cargo.lock']

"######################
"#  theme and colors  #
"######################

set background=dark    " Setting dark mode
"set background=light   " Setting light mode

colorscheme palenight

"########
"# Font #
"########

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

let mapleader=" "

"PHPCS & PHPMD
let g:phpqa_codesniffer_args = "--standard=Zend"

" PHP codesniffer binary (default = phpcs)
"let g:phpqa_codesniffer_cmd='~/.config/composer/vendor/squizlabs/php_codesniffer/bin/phpcs'
let g:phpqa_codesniffer_cmd='phpcs'

" Run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

let g:phpqa_messdetector_ruleset = "~/.config/composer/vendor/phpmd/phpmd"

" PHP mess detector binary (default = phpmd)
let g:phpqa_messdetector_cmd='.config/composer/vendor/phpmd/phpmd/src/bin/phpmd'

" Run mess detector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

let g:colorizer_nomap = 1


"###########################
"# Remove arrow key peasant#
"###########################
"

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
