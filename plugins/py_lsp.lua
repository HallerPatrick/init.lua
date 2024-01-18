local config = {
	"HallerPatrick/py_lsp.nvim",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("py_lsp").setup({
			capabilities = capabilities,
			default_venv_name = "venv",
			language_server = "pylsp",
			pylsp_plugins = {
				pycodestyle = {
					ignore = { "E501", "E503", "E203" },
					maxLineLength = 120,
				},
			},
		})
	end,
}

return config
