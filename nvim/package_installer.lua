local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- ensure that packer is installed
vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
  use 'github/copilot.vim'
--  use 'ludovicchabant/vim-gutentags'
	use 'endel/vim-github-colorscheme'
  use 'wbthomason/packer.nvim'
	use 'drewtempelmeyer/palenight.vim'
	use 'preservim/NERDTREE'
	use 'powerline/powerline-fonts'
	use 'chrisbra/csv.vim'
	use 'tpope/vim-fugitive'
	use 'idanarye/vim-merginal'
	use 'edkolev/tmuxline.vim'
	use 'janko-m/vim-test'
	use 'elixir-editors/vim-elixir'
	use 'ryanoasis/vim-devicons' 
	use 'mhinz/vim-mix-format'
	use 'airblade/vim-gitgutter'
	use 'plasticboy/vim-markdown'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/playground'
	use "williamboman/nvim-lsp-installer"
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/plenary.nvim'
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jose-elias-alvarez/nvim-lsp-ts-utils'
	use 'nvim-telescope/telescope.nvim'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use { 'hoob3rt/lualine.nvim', requires = {'ryanoasis/vim-devicons', opt = true} }
	use 'SirVer/ultisnips'
  end
)
