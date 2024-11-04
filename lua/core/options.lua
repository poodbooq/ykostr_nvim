vim.wo.number = true            -- Enable line numbers
vim.o.relativenumber = true     -- Enable relative number

vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim

vim.o.wrap = false              -- Enable/Disable line wrapping
vim.o.linebreak = true          -- Companion to wrap, don't split words

vim.o.mouse = 'a'               -- Enable mouse

vim.o.autoindent = true         -- Copy indent from current line when starting new one

vim.o.ignorecase = true         -- Case-insensitive searching UNLESS \C or capital in Search
vim.o.smartcase = true          -- Smart case

vim.o.shiftwidth = 4            -- Number of space
vim.o.tabstop = 4               -- Number of spaces for tab
vim.o.expandtab = true          -- Convert tabs to spaces

vim.o.scrolloff = 8             -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.sidescrolloff = 8         -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

vim.o.cursorline = true         -- Highlight the current line (default: false)

vim.o.splitbelow = true         -- Force all horizontal splits to go below current window (default: false)
vim.o.splitright = true         -- Force all vertical splits to go to the right of current window (default: false)

vim.o.hlsearch = false          -- Set highlight on search (default: true)

vim.o.showmode = false          -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.opt.termguicolors = true    -- Set termguicolors to enable highlight groups (default: false)
vim.o.whichwrap = 'bs<>[]hl'    -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.numberwidth = 4           -- Set number column width to 2 {default 4} (default: 4)
vim.o.swapfile = false          -- Creates a swapfile (default: true)

-- WARNING: I just copied options below, review and study them later
vim.o.smartindent = true                             -- Make indenting smarter again (default: false)
vim.o.showtabline = 2                                -- Always show tabs (default: 1)
vim.o.backspace = 'indent,eol,start'                 -- Allow backspace on (default: 'indent,eol,start')
vim.o.pumheight = 10                                 -- Pop up menu height (default: 0)
vim.o.conceallevel = 1                               -- So that `` is visible in markdown files (default: 1)
vim.wo.signcolumn = 'yes'                            -- Keep signcolumn on by default (default: 'auto')
vim.o.fileencoding = 'utf-8'                         -- The encoding written to a file (default: 'utf-8')
vim.o.cmdheight = 1                                  -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.breakindent = true                             -- Enable break indent (default: false)
vim.o.updatetime = 250                               -- Decrease update time (default: 4000)
vim.o.timeoutlen = 10000                             -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
vim.o.backup = false                                 -- Creates a backup file (default: false)
vim.o.writebackup = false                            -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.o.undofile = true                                -- Save undo history (default: false)
vim.o.completeopt =
'menuone,noselect'                                   -- Set completeopt to have a better completion experience (default: 'menu,preview')
vim.opt.shortmess:append 'c'                         -- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append '-'                         -- Hyphenated words recognized by searches (default: does not include '-')
vim.opt.formatoptions:remove { 'c', 'r', 'o' }       -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)

-- Transparency
vim.cmd [[
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight Normal ctermbg=none
      highlight NonText ctermbg=none
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Reduce the timeout length for key sequences
vim.opt.timeoutlen = 300 -- Set to 300ms or lower for quicker key recognition
vim.opt.ttimeoutlen = 10 -- Shortens timeout for mappings in terminal mode

vim.api.nvim_create_autocmd('VimEnter', {
    pattern = '*',
    callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            require('mini.files').open()
        end
    end,
})
