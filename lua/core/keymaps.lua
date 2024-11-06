-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Define constant default options
local opts = { noremap = true, silent = true }

-- Helper function to merge default options with additional options
local function map_opts(extra_opts)
    return vim.tbl_extend('force', opts, extra_opts or {})
end

-- Save file with description
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd> wa <CR><Esc>', map_opts { desc = 'Save file' })

-- Quit file with description
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', map_opts { desc = 'Quit file' })

-- save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>bo', function()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end, { desc = 'Close other buffers' })
vim.keymap.set('n', '``', '<cmd>b#<CR>', { desc = 'Go to previous buffer' })

-- Window management
vim.keymap.set('n', '<leader>\\', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>-', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

vim.keymap.set('n', '<C-л>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-о>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-р>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-д>', ':wincmd l<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)
vim.keymap.set('n', '<leader>дц', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)
vim.keymap.set('v', 'з', '"_вЗ', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>Q', '<cmd>qa<CR>', { noremap = true, silent = true, desc = 'Quit Neovim' })

local function change_font_size(delta)
    local guifont = vim.opt.guifont:get()[1] or 'Berkeley Mono:h14' -- default font and size
    local font, size = guifont:match '^(.-):h(%d+)'
    size = tonumber(size) + delta
    vim.opt.guifont = string.format('%s:h%d', font, size)
end

-- Key mappings for increasing and decreasing font size
vim.keymap.set('n', '<D-=>', function()
    change_font_size(1)
end, { desc = 'Increase font size' })
vim.keymap.set('n', '<D-->', function()
    change_font_size(-1)
end, { desc = 'Decrease font size' })
