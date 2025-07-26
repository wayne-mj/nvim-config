-- Tokyo night colour theme
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            transparent = false,
            styles = {
                comments = { italic = true },
                keywords = { italic = false, bold = true, },
                sidebars = "transparent",
                floats = "transparent",
            },
        })

        vim.cmd.colorscheme("tokyonight")
    end,
}
