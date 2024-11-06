return {
    'poodbooq/cyrillic.nvim',
    config = function()
        require('cyrillic').setup {
            no_cyrillic_abbrev = false, -- default
        }
    end,
}
