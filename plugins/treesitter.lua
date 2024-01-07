local configs = {
	treesitter = {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				ensure_installed = {
					"python",
					"lua",
					"rust",
					"json",
					"bash",
					"markdown",
					"markdown_inline",
					"vim",
					"svelte",
					"javascript",
					"typescript",
					"html",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	treesitter_textobjects = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							["la"] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
							["ra"] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

							["pi"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = { query = "@call.outer", desc = "Next function call start" },
							["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						},
					},
				},
			})
		end,
	},
}

return configs
