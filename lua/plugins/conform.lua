--Conform
return {
    {
        'stevearc/conform.nvim',
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
        config = function()
            local conform = require("conform")
            require("conform").setup({
                formatter_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier" },
                    fortran = { "fprettify", "findent" },
                    cobol = { "cobc_fmt" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
                formatters = {
                    cobc_fmt = {
                        command = "cobc",
                        args = { "--free", "--std=default", "-x", "-" },
                        stdin = true,
                    },
                },
            })

            vim.keymap.set({ "n", "v" }, "<leader>cl", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end, { desc = "Format file or range" })
        end
    },
}
