"Plugin Installation
call plug#begin()
Plug 'preservim/NERDTREE'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'drewtempelmeyer/palenight.vim'


Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'airblade/vim-gitgutter'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Colors, Lines, Syntax
set nocompatible
set hidden
set encoding=utf-8
set number
syntax on
set background=dark
colorscheme palenight
let g:airline_theme='palenight'

" Tab and Spacing
set tabstop=2
set softtabstop=2
set autoindent
set expandtab

"CMD Center
set directory=/tmp
set nobackup
set noswapfile
set showcmd
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
let mapleader=","
noremap <leader><space> :nohlsearch<CR>


let g:deoplete#enable_at_startup=1


