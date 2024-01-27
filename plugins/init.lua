local treesitter_configs = require("plugins.treesitter")
local telescope_configs = require("plugins.telescope")
local cmp_configs = require("plugins.cmp")
local lsp_configs = require("plugins.lsp")
local formmatter_configs = require("plugins.formatter")
local neoscroll_configs = require("plugins.neoscroll")
local comment_configs = require("plugins.comment")
local ssh_config = require("plugins.ssh")
local py_lsp_config = require("plugins.py_lsp")
local iron_config = require("plugins.iron")

local plugins =  {
    {
		"dracula/vim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({})
		end,
	},
	treesitter_configs.treesitter,
	treesitter_configs.treesitter_textobjects,
	telescope_configs.telescope,
	telescope_configs.harpoon,
	cmp_configs,
	lsp_configs,
    formmatter_configs,
    neoscroll_configs,
    comment_configs,
    ssh_config,
    py_lsp_config,
    iron_config
}

return plugins
