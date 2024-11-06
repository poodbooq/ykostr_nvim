return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
    },
    config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup lintes

        -- Formatters & linters for mason to install
        require('mason-null-ls').setup {
            ensure_installed = {
                'prettier', -- ts/js and markdown formatter
                'stylua', -- lua formatter
                -- "eslint_d", -- ts/js linter
                'shfmt', -- Shell formatter
                'checkmake', -- linter for Makefiles
                'gofmt', -- Go formatter
                'golines',
                'gofumpt',
                'golangci-lint', -- Go linter
                -- "rustfmt", -- Rust formatter
                -- "shellcheck", -- Bash linter
                'terraform_fmt', -- Terraform formatter
                'eslint', -- TS linter
                'markdownlint', -- Markdown linter
                -- "dockerfile_lint", -- Dockerfile linter
                'prettierd', -- Docker Compose YAML formatter (optional: or prettier)
            },
            automatic_installation = true,
        }

        local sources = {
            -- General formatters and linters
            diagnostics.checkmake,
            formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
            formatting.stylua,
            formatting.shfmt.with { args = { '-i', '4' } },
            formatting.terraform_fmt,
            require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
            require 'none-ls.formatting.ruff_format',

            -- Go
            formatting.gofmt,
            formatting.gofumpt,
            formatting.golines,
            formatting.goimports,
            diagnostics.golangci_lint,

            formatting.prettier.with {
                filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
            },

            -- Markdown
            diagnostics.markdownlint,
            formatting.prettier.with { filetypes = { 'markdown' } },

            -- Docker
            -- diagnostics.dockerfile_lint,

            -- Docker Compose (YAML)
            formatting.prettierd.with { filetypes = { 'yaml' } }, -- or prettier if preferred
        }

        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        null_ls.setup {
            -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
            opts = function(_, opts)
                local nls = require 'null-ls'
                opts.sources = vim.list_extend(opts.sources or {}, {
                    nls.builtins.code_actions.gomodifytags,
                    nls.builtins.code_actions.impl,
                    nls.builtins.formatting.goimports,
                    nls.builtins.formatting.golangci_lint,
                    nls.builtins.formatting.gofumpt,
                    nls.builtins.formatting.golines,
                })
            end,
            sources = sources,
            -- you can reuse a shared lspconfig on_attach callback here
            root_dir = require('null-ls.utils').root_pattern('.git', 'Makefile', 'package.json'),
            on_attach = function(client, bufnr)
                if client.supports_method 'textDocument/formatting' then
                    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format { async = false }
                        end,
                    })
                end
            end,
        }
    end,
}
