local utils = {}

function utils.open_split_buffer_goto_definition()
    -- Check how many windows are open
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local current_cursor_pos = vim.api.nvim_win_get_cursor(0)

    local current_buf = vim.api.nvim_get_current_buf()
    local current_win = vim.api.nvim_get_current_win()

    local target_win

    -- If there are alreay splits, then take the next one and set buffer to current buffer
    if #wins >= 2 then
        for _, win_num in pairs(wins) do
            if win_num ~= current_win then
                target_win = win_num
            end
        end
    else
        target_win = current_win
        vim.cmd("vsplit")
    end

    -- Set buffer for new window
    vim.api.nvim_win_set_buf(target_win, current_buf)

    -- Copy cursor position to new window for lsp defintion
    vim.api.nvim_win_set_cursor(target_win, current_cursor_pos)

    -- Focus new window
    vim.api.nvim_set_current_win(target_win)

    -- Call lsp
    vim.lsp.buf.definition()
end


return utils
