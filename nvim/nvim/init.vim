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
set expandtab
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
set completeopt=noinsert,menuone,noselect

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
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'noahfrederick/vim-laravel'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'yuezk/vim-js'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
Plug 'kdheepak/lazygit.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

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
" map <leader>ff :Telescope find_files<cr>
map <leader>ff :Files<cr>
map <leader>fs :Ag<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nr :NERDTreeRefreshRoot<cr>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automaticly close nerd tree if it's the last tab
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
autocmd Filetype * setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.blade.php set ft=blade

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

"######################
"#  theme and colors  #
"######################

" colorscheme palenight
colorscheme gruvbox

" let things
" fzf and ripgrep settings
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit'
    \ }

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