-- Comments
return {
    -- Main commenting plugin
    {
        "echasnovski/mini.comment",
        version = "*",
        config = function()
            require("mini.comment").setup({
                options = {
                    custom_commentsstring = function()
                        local cs = require("ts_context_commentstring.internal").calculate_commentstring()
                        return cs or vim.bo.commentstring
                    end,
                },
                -- hooks = {
                --     pre = function()
                --         -- require("ts_context_commentstring.internal").update_commentstring()
                --         local internal = require("ts_context_commentstring.internal")
                --         local calculated = internal.calculate_commentstring()
                --         if calculated then
                --             vim.bo.commentstring = calculated
                --         end
                --     end,
                -- },
            })
        end,
        -- opts = {
        --     -- hooks for contextual commenting
        --     hooks = {
        --         pre = function()
        --             require("ts_context_commentstring.internal").update_commentstring()
        --         end,
        --     },
        -- },
    },

    -- -- Tree-sitter powered contextual commentstring
    -- {
    --     "JoosepAlviste/nvim-ts-context-commentstring",
    --     lazy = false,
    --     opts = {
    --         enable_autocmd = false, -- we're manually triggering it via hook
    --     },
    -- },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })

            -- recommended for performance
            vim.g.skip_ts_context_commentstring_module = true
        end,
    }
}
