return {
    'simondrake/gomodifytags',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    opts = {
        transformation = 'snakecase',
    },
    config = function()
        vim.api.nvim_create_user_command('GoAddTags', function(opts)
            local gomodifytags = require 'gomodifytags'
            if gomodifytags and gomodifytags.GoAddTags then
                -- Parse arguments
                local tag = opts.fargs[1]
                local options = {}

                -- Check if "omitempty" was provided as an argument
                if vim.tbl_contains(opts.fargs, 'omitempty') then
                    options = { 'json=omitempty' }
                else
                    options = {}
                end

                -- Call GoAddTags with transformation and options
                gomodifytags.GoAddTags(tag, {
                    transformation = 'snakecase',
                    options = options,
                })
            else
                vim.notify('gomodifytags not loaded', vim.log.levels.ERROR)
            end
        end, { nargs = '+' })
    end,
}
