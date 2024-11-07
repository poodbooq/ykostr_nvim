return {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
        require('themery').setup {
            themes = {
                {
                    name = 'dracula',
                    colorscheme = 'dracula',
                },
                {
                    name = 'nightfox',
                    colorscheme = 'nightfox',
                },
                {
                    name = 'neovim-ayu',
                    colorscheme = 'ayu',
                },
                {
                    name = 'catppuccin',
                    colorscheme = 'catppuccin',
                },
                {
                    name = 'onedark',
                    colorscheme = 'onedark',
                },
                {
                    name = 'darkplus',
                    colorscheme = 'darkplus',
                },
                {
                    name = 'nord',
                    colorscheme = 'nord',
                },
            },
        }
    end,
}
