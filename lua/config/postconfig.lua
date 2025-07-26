-- Post configuration
--
-- Silence fortls messages
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    if client.name == "fortls" and result.type == vim.lsp.protocol.MessageType.Info then
        return
    end
    vim.notify(string.format("[%s] %s", client.name, result.message), result.type)
end

-- Define the divisions for COBOL
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cobol",
    callback = function()
        vim.opt.colorcolumn = "1,7,12,73"
        --         vim.cmd("hi ColorColumn guibg=#022b26") -- #054f45
        --         vim.opt.colorcolumn = "8,9,10,11"
        vim.cmd("hi ColorColumn guibg=#404040") -- #054f45
    end,

})
