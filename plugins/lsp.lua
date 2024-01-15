local setup_lsp = function()
	local lspconfig = require("lspconfig")

	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- lspconfig.pyright.setup({
	-- 	capabilities = capabilities,
	-- })

	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				})

				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
			return true
		end,
	})
end

local configs = {
	{
		"neovim/nvim-lspconfig",
		config = setup_lsp,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				symbol_map = require("plugins.symbols"),
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = true },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

return configs
