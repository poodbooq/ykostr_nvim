return {
    'echasnovski/mini.surround',
    opts = {
        mappings = {
            add = '<leader>gsa',            -- Add surrounding in Normal and Visual modes
            delete = '<leader>gsd',         -- Delete surrounding
            find = '<leader>gsf',           -- Find surrounding (to the right)
            find_left = '<leader>gsF',      -- Find surrounding (to the left)
            highlight = '<leader>gsh',      -- Highlight surrounding
            replace = '<leader>gsr',        -- Replace surrounding
            update_n_lines = '<leader>gsn', -- Update `n_lines`
        },
    },
}
