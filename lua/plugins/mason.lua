-- Mason
return
{
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            'hrsh7th/cmp-nvim-lsp',
        },
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                cobol_ls = {},
                fortls = {},
            }
        },
        config = function(_, opts)
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "lua_ls",
                    "eslint",
                    "bashls",
                },
                automatic_installation = true,
            })

            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.diagnostic.config({
                virtual_text = true,
                --virtual_lines = true,
                underline = true
            })
            vim.lsp.enable('lua_ls')
        end,
    }
}
