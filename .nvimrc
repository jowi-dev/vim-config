"Plugin Installation
call plug#begin()
  Plug 'preservim/NERDTREE'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'powerline/powerline-fonts'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'chrisbra/csv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'edkolev/tmuxline.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'janko-m/vim-test'
  Plug 'dense-analysis/ale'
  Plug 'ryanoasis/vim-devicons' 
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'rust-lang/rust.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'
  Plug 'airblade/vim-gitgutter'
  Plug '~/.fzf'
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
set shiftwidth=2
set autoindent
set expandtab
"CMD Center
set directory=/tmp
set nobackup
set noswapfile
set showcmd
set wildmenu
set lazyredraw
set ttyfast
set showmatch
set incsearch
set hlsearch
let mapleader=","
noremap <leader><space> :nohlsearch<CR>
noremap <leader>m :let @+=expand("%")<CR>
noremap <leader>l :NERDTreeToggle<CR>
noremap <leader>a :ArrangeColumn<CR>
noremap <leader>gs :GitGutterStageHunk<CR>
noremap <leader>gr :GitGutterRevertHunk<CR>
noremap <leader>q :bprev<CR>
noremap <leader>p :bnext<CR>
noremap <C-p> :FzfPreviewProjectFiles <CR>
noremap <C-f> :FzfPreviewProjectGrep<Space>
:filetype plugin on
let g:deoplete#enable_at_startup=1
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore='node_modules\|DS_Store\'
let g:gitgutter_realtime=0
let g:gitgutter_eager=0

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"     " unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = '▶'
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.branch = '⎇'
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.whitespace = 'Ξ'
"     " airline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''


