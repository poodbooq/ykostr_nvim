return {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    config = function(_, opts)
        require('obsidian').setup(opts)
        -- Define custom keymaps using official commands
        vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = 'New Obsidian Note' })
        vim.keymap.set('n', '<leader>oo', ':ObsidianQuickSwitch<CR>', { desc = 'Quick Switch Note' })
        vim.keymap.set('n', '<leader>ol', ':ObsidianFollowLink<CR>', { desc = 'Follow Link' })
        vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Show Backlinks' })
        vim.keymap.set('n', '<leader>ot', ':ObsidianToggleCheckbox<CR>', { desc = 'Toggle Checkbox' })
        vim.keymap.set('n', '<leader>oy', ':ObsidianLink<CR>', { desc = 'Link to Note' })
        vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', { desc = 'Search Notes' })
        vim.keymap.set('n', '<leader>otd', ':ObsidianToday<CR>', { desc = "Open Today's Note" })
        vim.keymap.set('n', '<leader>oty', ':ObsidianYesterday<CR>', { desc = "Open Yesterday's Note" })
        vim.keymap.set('n', '<leader>otm', ':ObsidianTomorrow<CR>', { desc = "Open Tomorrow's Note" })
        vim.keymap.set('n', '<leader>od', ':ObsidianDailies<CR>', { desc = 'Open Daily Notes Picker' })
        vim.keymap.set('n', '<leader>ow', ':ObsidianWorkspace<CR>', { desc = 'Switch Workspace' })
    end,
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = 'work',
                path = '/Users/yevhen.kostryka/Library/Mobile Documents/iCloud~md~obsidian/Documents/Work',
            },
            {
                name = 'visual novel',
                path = '/Users/yevhen.kostryka/Library/Mobile Documents/iCloud~md~obsidian/Documents/Visual Novel',
            },
        },
        templates = {
            folder = 'templates',
            date_format = '%Y-%m-%d-%a',
            time_format = '%H:%M',
        },

        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            -- folder = "notes/dailies",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = '%Y-%m-%d',
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = '%B %-d, %Y',
            -- Optional, default tags to add to each new daily note created.
            default_tags = { 'daily-notes' },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil,
        },
        new_notes_location = 'inbox',
        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },

        -- mappings = {
        --   -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        --   ["gf"] = {
        --     action = function()
        --       return require("obsidian").util.gf_passthrough()
        --     end,
        --     opts = { noremap = false, expr = true, buffer = true },
        --   },
        --   -- Toggle check-boxes.
        --   ["<leader>ch"] = {
        --     action = function()
        --       return require("obsidian").util.toggle_checkbox()
        --     end,
        --     opts = { buffer = true },
        --   },
        --   -- Smart action depending on context, either follow link or toggle checkbox.
        --   ["<cr>"] = {
        --     action = function()
        --       return require("obsidian").util.smart_action()
        --     end,
        --     opts = { buffer = true, expr = true },
        --   },
        -- },

        picker = {
            -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
            name = 'telescope.nvim',
            -- Optional, configure key mappings for the picker. These are the defaults.
            -- Not all pickers support all mappings.
            note_mappings = {
                -- Create a new note from your query.
                new = '<C-x>',
                -- Insert a link to the selected note.
                insert_link = '<C-l>',
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = '<C-x>',
                -- Insert a tag at the current location.
                insert_tag = '<C-l>',
            },
        },

        ui = {
            enable = true,          -- set to false to disable all additional syntax features
            update_debounce = 200,  -- update delay after a text change (in milliseconds)
            max_file_length = 5000, -- disable UI features for files with more than this many lines
            -- Define how various check-boxes are displayed
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
                ['x'] = { char = '', hl_group = 'ObsidianDone' },
                ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
                ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
                ['!'] = { char = '', hl_group = 'ObsidianImportant' },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = '•', hl_group = 'ObsidianBullet' },
            external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = 'ObsidianRefText' },
            highlight_text = { hl_group = 'ObsidianHighlightText' },
            tags = { hl_group = 'ObsidianTag' },
            block_ids = { hl_group = 'ObsidianBlockID' },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = '#f78c6c' },
                ObsidianDone = { bold = true, fg = '#89ddff' },
                ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
                ObsidianTilde = { bold = true, fg = '#ff5370' },
                ObsidianImportant = { bold = true, fg = '#d73128' },
                ObsidianBullet = { bold = true, fg = '#89ddff' },
                ObsidianRefText = { underline = true, fg = '#c792ea' },
                ObsidianExtLinkIcon = { fg = '#c792ea' },
                ObsidianTag = { italic = true, fg = '#89ddff' },
                ObsidianBlockID = { italic = true, fg = '#89ddff' },
                ObsidianHighlightText = { bg = '#75662e' },
            },
        },
        attachments = {
            -- The default folder to place images in via `:ObsidianPasteImg`.
            -- If this is a relative path it will be interpreted as relative to the vault root.
            -- You can always override this per image by passing a full path to the command instead of just a filename.
            img_folder = 'assets/imgs', -- This is the default

            -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
            ---@return string
            img_name_func = function()
                -- Prefix image names with timestamp.
                return string.format('%s-', os.time())
            end,

            -- A function that determines the text to insert in the note when pasting an image.
            -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
            -- This is the default implementation.
            ---@param client obsidian.Client
            ---@param path obsidian.Path the absolute path to the image file
            ---@return string
            img_text_func = function(client, path)
                path = client:vault_relative_path(path) or path
                return string.format('![%s](%s)', path.name, path)
            end,
        }, -- see below for full list of options 👇
    },
}
