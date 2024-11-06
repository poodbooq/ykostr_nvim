return {
    {
        'SuperBo/fugit2.nvim',
        opts = {
            width = 70,
            external_diffview = true, -- tell fugit2 to use diffview.nvim instead of builtin implementation.
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim',
            {
                'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
                dependencies = { 'stevearc/dressing.nvim' },
            },
        },
        cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
        keys = {
            { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' },
        },
    },
    {
        'sindrets/diffview.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        -- lazy, only load diffview by these commands
        cmd = {
            'DiffviewFileHistory',
            'DiffviewOpen',
            'DiffviewToggleFiles',
            'DiffviewFocusFiles',
            'DiffviewRefresh',
        },
    },
    -- {
    --     'kdheepak/lazygit.nvim',
    --     lazy = true,
    --     cmd = {
    --         'LazyGit',
    --         'LazyGitConfig',
    --         'LazyGitCurrentFile',
    --         'LazyGitFilter',
    --         'LazyGitFilterCurrentFile',
    --     },
    --     -- optional for floating window border decoration
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --     },
    --     -- setting the keybinding for LazyGit with 'keys' is recommended in
    --     -- order to load the plugin when the command is run for the first time
    --     keys = {
    --         { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    --     },
    -- },
}
