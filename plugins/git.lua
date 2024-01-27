local config = {
	{
			"akinsho/git-conflict.nvim",
			version = "*",
			config = function()
				require("git-conflict").setup()
			end,
      }
}

return config
