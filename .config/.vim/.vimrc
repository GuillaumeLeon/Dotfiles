" ##################
" # General option #
" ##################

" ## Encodage

" Buffer encoding in UTF-8
set encoding=utf-8

" File encoding in UTF-8
set fileencoding=utf-8

" #####################
" # Shell, X and Unix #
" #####################

" ## For shell 

" Mouse
set mouse=a

" max size of a row
set textwidth=80

set termguicolors

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
set number

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

" ###########
" # Plugins #
" ###########

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle
" Install:
"  git clone https://github.com/VundleVim/Vundle.vim.git
"  ~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/mattn/emmet-vim'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/Lokaltog/vim-easymotion'
Plugin 'https://github.com/itchyny/lightline.vim'
Plugin 'https://github.com/Shutnik/jshint2.vim'
"Plugin 'https://github.com/skammer/vim-css-color'
Plugin 'morhetz/gruvbox'
Plugin 'tomasiser/vim-code-dark'
Plugin 'arcticicestudio/nord-vim'
Plugin 'https://github.com/aonemd/kuroi.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'https://github.com/joshdick/onedark.vim.git'
Plugin 'dracula/vim'
Plugin 'https://github.com/pangloss/vim-javascript.git'
Plugin 'makerj/vim-pdf'

call vundle#end()         
filetype plugin indent on 

" Pathogen
" Install:
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

"##############
"#  shortcut  #
"##############

" Insert mod
inoremap <C-_> <Esc>u<CR>
inoremap <F3> <Esc>:vsp<CR>

" Normal mod
noremap <F3> :vsp <CR>

" Bypass the readonly mod 
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"##########
"# Conque #
"##########

"autocmd vimenter * ConqueTermSplit bash
"autocmd vimenter * resize 15

"#############
"# NerdTree  #
"#############

" Automatically open NERDTREE at vim start
"autocmd vimenter * NERDTree

" Automatically closing vim if the nerdtree tab is the last one 
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"######################
"#  theme and colors  #
"######################

set background=dark    " Setting dark mode
"set background=light   " Setting light mode

"colorscheme Tomorrow-Night

"colorscheme gruvbox

"colorscheme codedark

"colorscheme nord

"colorscheme kuroi

colorscheme onedark

"colorscheme dracula
