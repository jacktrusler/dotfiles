return {
    {
        "williamboman/mason.nvim", -- UI for fetching/downloading LSPs
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",          -- Bridges mason and lspconfig
        dependencies = { "williamboman/mason.nvim" }, -- mason-lspconfig must load after mason
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls",
                    "ts_ls",
                    "denols",
                    "jsonls",
                    "html",
                    "cssls",
                    "yamlls",
                    "lua_ls",
                    "rust_analyzer",
                    "tailwindcss",
                    "eslint",
                    "clangd",
                    "pyright",
                    "gopls",
                    "dockerls",
                    "solidity_ls_nomicfoundation",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig", -- neovims configuation for the built in client
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            local ok, lspconfig = pcall(require, 'lspconfig')
            if (not ok) then
                print("require lspconfig failed")
                return
            end
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                client.server_capabilities.semanticTokensProvider = nil

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            -- Change to log level "debug" to see all lsp info
            -- Note: If you keep debug on it creates a massive file
            vim.lsp.set_log_level("off");

            --IIFE to setup diagnostics... Need semicolon on the line above to deliminate IIFE's in lua, without it trys to curry the function above
            --https://stackoverflow.com/questions/53656742/defining-and-calling-function-at-the-same-time-in-lua
            (function()
                vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics,
                    {
                        virtual_text = false,
                        signs = true,
                        update_in_insert = false,
                        underline = true,
                    }
                )
            end)();

            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- Set up some servers with custom settings --
            lspconfig.yamlls.setup {
                on_attach = on_attach,
                capabilities = capabilities,

                settings = {
                    yaml = {
                        schemaStore = {
                            url = "https://www.schemastore.org/api/json/catalog.json",
                            enable = true,
                        }
                    }
                },
            }

            lspconfig["solidity"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
                filetypes = { "solidity" },
                root_dir = lspconfig.util.root_pattern("foundry.toml"),
                single_file_support = true,
            })

            lspconfig.denols.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            })

            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                single_file_support = false,
            })

            lspconfig.eslint.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
                settings = {
                    workingDirectory = { mode = 'location' },
                },
                root_dir = lspconfig.util.find_git_ancestor,
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                            disable = { "missing-parameters", "missing-fields" },
                        },
                    },
                },
            })

            lspconfig.cssls.setup({
                settings = {
                    css = {
                        lint = {
                            unknownAtRules = 'ignore',
                        },
                    },
                },
            })

            -- Set up the rest of the servers with default settings --
            local all_servers = {
                "sqlls",
                "jdtls",
                "jsonls",
                "html",
                "rust_analyzer",
                "tailwindcss",
                "clangd",
                "pyright",
                "gopls",
                "templ",
                "dockerls",
            }

            for _, server in ipairs(all_servers) do
                lspconfig[server].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }
            end

            local patterns = { '*.lua', '*.tsx', '*.jsx', '*.ts', '*.js', '*.css', '*.html', '*.yaml', '*.java', '*.rs',
                '*.json', '*.sql' }

            vim.api.nvim_create_augroup('AutoFormatting', {})
            vim.api.nvim_create_autocmd('BufWritePre', {
                pattern = patterns,
                group = 'AutoFormatting',
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    },
}