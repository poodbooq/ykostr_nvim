return {
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            require('lsp_signature').setup {
                bind = true,
                handler_opts = {
                    border = 'rounded',
                },
                floating_window = true, -- Show signature in a floating window
                hint_enable = false, -- Disable inline hints if not needed
                toggle_key = '<M-x>', -- Optional: keybinding to toggle signature on/off
            }
        end,
    },
}
