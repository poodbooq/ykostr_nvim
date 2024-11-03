return {
    'mfussenegger/nvim-lint',
    optional = true,
    opts = function(_, opts)
        opts.linters = {
            markdownlint = {
                args = { '--disable', 'MD013', 'MD007', '--config', '~/.markdownlint.jsonc', '--' },
            },
        }
        for _, ft in ipairs(sql_ft) do
            opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
            table.insert(opts.linters_by_ft[ft], 'sqlfluff')
        end
    end,
}
