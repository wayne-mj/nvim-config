local M = {}

local term_buf = nil
local term_win = nil

local function create_floating_term(opts)
    opts = opts or {}
    local ui = vim.api.nvim_list_uis()[1]
    local width = opts.width or math.floor(ui.width * 0.8)
    local height = opts.height or math.floor(ui.height * 0.8)
    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width - width) / 2)

    -- Create new buffer if it doesn't exist
    term_buf = vim.api.nvim_create_buf(false, true)

    -- Open floating window
    term_win = vim.api.nvim_open_win(term_buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Launch terminal
    vim.fn.termopen(vim.o.shell)
    vim.cmd("startinsert")
end

function M.open(opts)
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_set_current_win(term_win)
    else
        create_floating_term(opts)
    end
end

function M.close()
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_close(term_win, true)
        term_win = nil
        term_buf = nil
    end
end

function M.toggle()
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        M.close()
    else
        M.open()
    end
end

return M
