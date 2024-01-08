local configs = {
	telescope = {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	telescope_actions = {
		find_files = function()
			return require("telescope.builtin").find_files()
		end,
		live_grep = function()
			return require("telescope.builtin").live_grep()
		end,
		buffers = function()
			return require("telescope.builtin").buffers()
		end,
		lsp_references = function()
			return require("telescope.builtin").lsp_references()
		end,
	},
	-- Belongs to telescope to me
	harpoon = {
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	harpoon_actions = {
		add_file = function()
			return require("harpoon.mark").add_file()
		end,
		toggle_ui = function()
			-- There is probably a better way to do use telescope
			return vim.api.nvim_command(":Telescope harpoon marks")
		end,
		python_terminal = function()
			local harpoon = require("harpoon.term")
			harpoon.gotoTerminal(1)
			harpoon.sendCommand(1, "source venv/bin/activate \n")
			harpoon.sendCommand(1, "clear \n")
		end,
		goto_terminal = function()
			require("harpoon.term").gotoTerminal(1)
		end,
	},
}

return configs
