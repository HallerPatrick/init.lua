local config = {
	"Vigemus/iron.nvim",
	keys = {
		{ "<leader>i", vim.cmd.IronRepl, desc = "Toggle REPL" },
		{ "<leader>I", vim.cmd.IronRestart, desc = "Restart REPL" },

		-- these keymaps need no right-hand-side, since that is defined by the
		-- plugin config further below
		{ "+", mode = { "n", "x" }, desc = "Send-to-REPL Operator" },
		{ "++", desc = "Send Line to REPL" },
	},

	-- since irons's setup call is `require("iron.core").setup`, instead of
	-- `require("iron").setup` like other plugins would do, we need to tell
	-- lazy.nvim which module to via the `main` key
	main = "iron.core",

	opts = {
		keymaps = {
			send_line = "++",
			visual_send = "+",
			send_motion = "+",
		},
		config = {
			-- this defined how the repl is opened. Here we set the REPL window
			-- to open in a horizontal split to a bottom, with a height of 10
			-- cells.
			repl_open_cmd = "vertical bot 100 split",

			-- This defines which binary to use for the REPL. If `ipython` is
			-- available, it will use `ipython`, otherwise it will use `python3`.
			-- since the python repl does not play well with indents, it's
			-- preferable to use `ipython` or `bypython` here.
			-- (see: https://github.com/Vigemus/iron.nvim/issues/348)
			repl_definition = {
				python = {
					command = function()
						local ipythonAvailable = vim.fn.executable("ipython") == 1
						local binary = ipythonAvailable and "ipython" or "python3"
						return { binary }
					end,
				},
			},
		},
	},
}

return config
