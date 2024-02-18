vim.g.mapleader = " "

-- The phmaker basics
vim.keymap.set({ "n", "v" }, "H", "_")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Move with linebreaks
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>v", ":vs<CR>")

-- Toggle previous buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Display files for opening that are adjacent to current file
vim.keymap.set("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>")

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Disable Ex Mode
vim.keymap.set("n", "q:", "<Nop>")
vim.keymap.set("n", "Q:", "<Nop>")


-- Plugins keymappings
vim.keymap.set("n", "-", function() require('oil').open() end)

local telescope = require("plugins.telescope")

vim.keymap.set("n", "<leader>f", telescope.telescope_actions.find_files)
vim.keymap.set("n", "<leader>s", telescope.telescope_actions.live_grep)
vim.keymap.set("n", "<leader>b", telescope.telescope_actions.buffers)
vim.keymap.set("n", "<leader>fu", telescope.telescope_actions.lsp_references)

vim.keymap.set("n", "<leader>ha", telescope.harpoon_actions.add_file)
vim.keymap.set("n", "<leader>hs", telescope.harpoon_actions.toggle_ui)
vim.keymap.set("n", "<leader>hp", telescope.harpoon_actions.python_terminal)
vim.keymap.set("n", "<leader>ht", telescope.harpoon_actions.goto_terminal)

vim.keymap.set("n", "<leader>i", ":IronRepl<CR>")
vim.keymap.set("n", "<leader>I", ":IronRestart<CR>")
vim.keymap.set("n", "<leader>if", ":IronFocus<CR>")

-- LSP keymappings
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", require("utils").open_split_buffer_goto_definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- For diagnostics, that are to long to be displayed inline
local display_dianostics = function()
  vim.diagnostic.open_float(0, { scope = "line" })
end

vim.keymap.set("n", "<leader>x", display_dianostics)


local function insert_breakpoint()
  -- Check if the current buffer is a Python file
  if vim.bo.filetype == 'python' then
    -- Get the current line number and the current line text
    local line_num = vim.api.nvim_win_get_cursor(0)[1]
    local current_line = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]

    -- Extract the indentation of the current line
    local indentation = current_line:match("^%s*")

    -- Prepare the breakpoint statement with the same indentation
    local breakpoint_stmt = indentation .. "breakpoint()"

    -- Insert the breakpoint statement at the line after the current line
    vim.api.nvim_buf_set_lines(0, line_num, line_num, false, { breakpoint_stmt })
  else
    print("Not a Python file")
  end
end

vim.keymap.set('n', '<leader>bp', insert_breakpoint)

vim.keymap.set('n', '<leader>da', ":RunScriptWithArgs ")
vim.keymap.set('n', '<leader>do', function() require("dap").continue() end)
vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dn', function() require("dap").step_over() end)
vim.keymap.set('n', '<leader>dt', function() require("dap").terminate() end)
