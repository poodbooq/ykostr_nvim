return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function(_, opts)
            require('catppuccin').setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme catppuccin]]
        end,
    },
    -- {
    --     "tiagovla/tokyodark.nvim",
    --     opts = {
    --         transparent_background = true -- initial state
    --     },
    -- config = function(_, opts)
    --     require("tokyodark").setup(opts) -- calling setup is optional
    --     vim.cmd [[colorscheme tokyodark]]
    -- end,
    -- }
}
