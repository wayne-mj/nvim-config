-- Comments
return {
    "echasnovski/mini.comment",
    version = false, -- always use latest
    config = function()
        -- Set custom commentstring for TypeScript and React variants
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "typescript",
                "typescriptreact",
                "javascriptreact",
            },
            callback = function()
                vim.bo.commentstring = "{ /*** %s ***/ }"
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "fortran",
                "f90", "f95", "f03", "f08"
            },
            callback = function()
                vim.bo.commentstring = "! %s !"
            end
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "cobol",
                "cob", "cbl"
            },
            callback = function()
                vim.bo.commentstring = "* > %s < "
            end
        })

        -- Setup mini.comment with default mappings
        require("mini.comment").setup({
            -- Optional: you can change mappings or other options here
            mappings = {
                comment = "gc",
                comment_line = "gcc",
                textobject = "gc",
            },
            options = {
                ignore_blank_line = false,
                start_of_line = true,
                pad_comment_parts = true,
            },
            hooks = {
                pre = function()
                    local cs = vim.bo.commentstring
                    local prefix = cs:match("^(.-)%%s")
                    return function(line)
                        return not vim.startswith(vim.trim(line), vim.trim(prefix or ""))
                    end
                end,
            },
        })
    end,
}
