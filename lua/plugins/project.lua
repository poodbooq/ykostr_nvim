return {
    {
        'ahmedkhalf/project.nvim',
        config = function()
            require('project_nvim').setup {
                detection_methods = { 'lsp', 'pattern' },          -- Detect project root via LSP or patterns
                patterns = { '.git', 'Makefile', 'package.json' }, -- Common root indicators
                ignore_lsp = {},                                   -- List of LSP servers to ignore
                exclude_dirs = { '~/projects/excluded' },          -- Directories to exclude
                show_hidden = true,                                -- Show hidden files
                silent_chdir = false,                              -- Show messages when switching projects
            }

            -- Integrate with Telescope
            require('telescope').load_extension 'projects'

            vim.keymap.set('n', '<leader>p', '<cmd>Telescope projects<CR>', { desc = 'Open Projects' })
        end,
    },
}
