
vim.g.mapleader = " "

-- The phmaker basics
vim.keymap.set({"n", "v"}, "H", "_")
vim.keymap.set({"n", "v"}, "L", "$")

-- Move with linebreaks
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

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

local telescope_actions = require("plugins.telescope").telescope_actions

vim.keymap.set("n", "<leader>f", telescope_actions.find_files)
vim.keymap.set("n", "<leader>s", telescope_actions.live_grep)
vim.keymap.set("n", "<leader>b", telescope_actions.buffers)
vim.keymap.set("n", "<leader>fu", telescope_actions.lsp_references)

local harpoon_actions = require("plugins.telescope").harpoon_actions

vim.keymap.set("n", "<leader>ha", harpoon_actions.add_file)
vim.keymap.set("n", "<leader>hs", harpoon_actions.toggle_ui)

-- LSP keymappings

vim.keymap.set("n", "gd", vim.lsp.buf.declaration)
vim.keymap.set("n", "gD", require("utils").open_split_buffer_goto_definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- For diagnostics, that are to long to be displayed inline
local display_dianostics = function()
    vim.diagnostic.open_float(0, { scope = "line" })
end

vim.keymap.set("n", "<leader>x", display_dianostics)


