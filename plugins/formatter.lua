return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
			},
		})

		vim.api.nvim_create_user_command("Format", function()
			require("conform").format()
		end, {})
	end,
}
