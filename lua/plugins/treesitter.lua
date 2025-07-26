-- Treesitter
return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            -- context_commentstring = {
            --     enable = true,
            --     enable_autocmd = false, -- We're using a manual hook in mini.comment
            -- },
            ensure_installed = {
                "vim", "vimdoc", "lua", "luadoc", "bash", "c", "query", "markdown", "markdown_inline",
                "typescript", "tsx", "html", "javascript"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                },
            },
            additional_vim_regex_highlighting = false,
        })
    end
}
