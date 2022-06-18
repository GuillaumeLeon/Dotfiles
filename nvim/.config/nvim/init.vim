" MAP LEADER 
let mapleader = " " 

syntax on

" Set Things
set encoding=UTF-8
set fileencoding=UTF-8
set mouse=a
set textwidth=80
set termguicolors
set hlsearch " Higlight the search patern
set path+=**
set smartindent
set autoindent 
set expandtab
set shiftwidth=4  
set softtabstop=4
set relativenumber
set ttyfast
set noeb vb t_vb=
set noswapfile
set linebreak 
set shell=/bin/zsh 
set guifont =Hack\ Nerd\ Font\ 12
set background=dark
set completeopt=noinsert,menuone,noselect

" ###########
" # Plugins #
" ###########

" Install Vim plug Automaticly
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

" set the runtime path to include Vundle and initialize
call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Autocomplete server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP
Plug 'noahfrederick/vim-laravel'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'

Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js'

" git
Plug 'kdheepak/lazygit.nvim'

" jsx
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

filetype plugin indent on 

noremap <F3> :vsp <CR>
noremap <F2> :sp <CR>
noremap <C-k> :LazyGit <CR>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabnext<cr> 
map <leader>tb :tabprevious<cr> 

map <leader>ff <cmd>Telescope find_files<cr>
map <leader>fs <cmd>Telescope live_grep<cr>

map <leader>nn :NERDTreeToggle<cr>
map <leader>nr :NERDTreeRefreshRoot<cr>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)


cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automaticly close nerd tree if it's the last tab
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
autocmd Filetype * setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.blade.php set ft=blade

"######################
"#  theme and colors  #
"######################

" colorscheme palenight
colorscheme gruvbox

" let things
let g:ultisnips_php_scalar_types = 1
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.DS_Store$', '.git$', 'Cargo.lock', '.idea']
" let g:coc_disable_startup_warning = 1
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
