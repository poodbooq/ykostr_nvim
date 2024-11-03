-- Import core modules (basic keymaps and settings)
require 'core.options'
require 'core.keymaps'

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
    require 'plugins.colortheme',
    require 'plugins.neotree',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.none-ls',
    require 'plugins.neotest',
    require 'plugins.conform',
    require 'plugins.nvim-lint',
    require 'plugins.lsp_signature',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.misc',
    require 'plugins.marks',
    require 'plugins.overseer',
    require 'plugins.obsidian',
    require 'plugins.tint',
    require 'plugins.trouble',
    require 'plugins.twilight',
    require 'plugins.zen',
    require 'plugins.harpoon',
    require 'plugins.project',
    require 'plugins.mini',
    require 'plugins.autosession',
}
