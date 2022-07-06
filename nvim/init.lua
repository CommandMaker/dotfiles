-- Config
vim.wo.number = true
vim.o.showmode = false
vim.o.expandtab = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.ignorecase = true

-- Plugins
vim.call('plug#begin')

local Plug = vim.fn['plug#']

  -- Color scheme
Plug('catppuccin/nvim', {as = 'catppuccin'})

Plug('nvim-lualine/lualine.nvim')
Plug('kyazdani42/nvim-web-devicons')

  -- Keys remap
Plug('b0o/mapx.nvim')

  -- File explorer
Plug('preservim/nerdtree')

  -- Line highlight
Plug('miyakogi/conoline.vim')

vim.call('plug#end')


-- LuaLine config
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- NerdTree config
vim.g.NERDTreeShowHidden = true

-- Conoline config
vim.g.conoline_auto_enable = true
vim.g.conoline_color_insert_dark = 'guibg=#1b1827'
vim.g.conoline_color_normal_dark = 'guibg=#1b1827'

-- MapX Config
require('mapx').setup{ global = 'force' }

nnoremap('<F3>', ':let @/=""<cr><esc>', 'silent')
nnoremap('<F6>', ':NERDTreeToggle<cr>')
nnoremap('<F7>', ':NERDTreeFocus<cr>')

-- Color scheme
require('catppuccin').setup {
  transparent_background = true,
}

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]

-- Clear command line after type
vim.api.nvim_exec('autocmd CursorHold * echon \'\'', true)
