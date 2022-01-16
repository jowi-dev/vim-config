-- init.lua
-- Auto install if not exist
local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  cmd('!git clone --depth 1 https://github.com/savq/paq-nvim.git '..install_path)
end

-- Load the plugin manager
cmd 'packadd paq-nvim'

-- Set the short hand
local plug = require('paq-nvim').paq

-- Make paq manage it self
plug {'savq/paq-nvim', opt=true}


plug 'endel/vim-github-colorscheme'
plug 'drewtempelmeyer/palenight.vim'
plug 'preservim/NERDTREE'
plug 'powerline/powerline-fonts'
plug 'chrisbra/csv.vim'
plug 'tpope/vim-fugitive'
plug 'idanarye/vim-merginal'
plug 'edkolev/tmuxline.vim'
plug 'janko-m/vim-test'
--plug 'dense-analysis/ale'
plug 'elixir-editors/vim-elixir'
plug 'ryanoasis/vim-devicons' 

plug 'mhinz/vim-mix-format'

plug 'airblade/vim-gitgutter'

-- Nightlys
plug {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
plug 'nvim-treesitter/playground'
plug 'neovim/nvim-lspconfig'
plug 'nvim-lua/plenary.nvim'
plug 'nvim-telescope/telescope.nvim'
plug 'hrsh7th/cmp-nvim-lsp'
plug 'hrsh7th/cmp-buffer'
plug 'hrsh7th/cmp-path'
plug 'hrsh7th/cmp-cmdline'
plug 'hrsh7th/nvim-cmp'

plug { 'hoob3rt/lualine.nvim', requires = {'ryanoasis/vim-devicons', opt = true} }

plug 'SirVer/ultisnips'
-- plug 'L3MON4D3/LuaSnip'
 --plug 'saadparwaiz1/cmp_luasnip'

require('lualine').setup({theme= 'horizon'})
--require('lualine').setup({theme= 'onelight'})
vim.g.tmuxline_preset = 'horizon'
--vim.g.tmuxline_preset = 'papercolor_light'

vim.opt.termguicolors = true

-- Colors, Lines, Syntax
--vim.opt.nocompatible = true
vim.opt.hidden = true
vim.opt.encoding='utf-8'
vim.opt.number=true
vim.opt.background='dark'
cmd('syntax on')
cmd('colorscheme github')
--cmd('colorscheme palenight')
--cmd('colorscheme horizon')


-- Tab and Spacing
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.autoindent=true
vim.opt.expandtab=true

-- CMD Center
vim.opt.directory='/tmp'
vim.opt.showcmd=true
vim.opt.wildmenu=true
vim.opt.lazyredraw=true
vim.opt.ttyfast=true
vim.opt.showmatch=true
vim.opt.incsearch=true
vim.opt.hlsearch=true


vim.g.mapleader=","
local map = vim.api.nvim_set_keymap
map('n', '<leader><space>', ':nohlsearch<CR>', {noremap=true})
map('n',  '<leader>m', ':let @+=expand("%")<CR>',{noremap=true})
map('n',  '<leader>k', '"*y<CR>',{noremap=true})
map('n',  '<leader>l',  ':NERDTreeToggle<CR>',{noremap=true})
map('n',  '<leader>a',  ':ArrangeColumn<CR>',{noremap=true})
map('n',  '<leader>gs', ':GitGutterStageHunk<CR>',{noremap=true})
map('n',  '<leader>gr', ':GitGutterRevertHunk<CR>',{noremap=true})
map('n',  '<leader>gd', ':Gvdiffsplit!<CR>',{noremap=true})
map('n',  '<leader>gq', ':diffget //2<CR>',{noremap=true})
map('n',  '<leader>gp', ':diffget //3<CR>',{noremap=true})
map('n',  '<leader>c',  ':bd<CR>',{noremap=true})
map('n',  '<leader>q',  ':bprev<CR>',{noremap=true})
map('n',  '<leader>p',  ':bnext<CR>',{noremap=true})
map('n',  '<C-p>',      ':Telescope find_files<CR>',{noremap=true})
map('n',  '<C-f>',      ':Telescope live_grep<CR>',{noremap=true})
map('i', '<leader>uex',   ':UltiSnipsExpandTrigger',{noremap=true})
map('n', '<leader>ued',   ':UltiSnipsEdit',{noremap=true})
map('n', '<leader>uf',   ':UltiSnipsJumpForwardTrigger',{noremap=true})
map('n', '<leader>ub',   ':UltiSnipsJumpBackwardTrigger',{noremap=true})

-- If you want :UltiSnipsEdit to split your window.
vim.g.ultisnips_edit_split="vertical"

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's'}),
    },
    sources = {
      { name = 'nvim_lsp' },
      --{ name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }
    }, {
      { name = 'buffer' },
    }
  })


  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require'lspconfig'.elixirls.setup{
  cmd = {"/Users/jwilliams/language_server.sh"},
  capabilities = capabilities
}




--:filetype plugin on
vim.g.gitgutter_realtime=0
vim.g.gitgutter_eager=0


vim.g.mix_format_on_save = 1

