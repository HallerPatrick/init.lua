local cmp_setup = function()
	local cmp = require("cmp")
	local lspkind = require("lspkind")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "emoji" },
			-- { name = "spell" },
		}),
		experimental = {
			ghost_text = true,
		},
		mapping = {
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<CR>"] = cmp.mapping.confirm({
				select = true,
			}),
			-- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
			["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		},
		formatting = {
			format = lspkind.cmp_format({
				with_text = false,
				maxwidth = 70,
				mode = "symbol_text",
				menu = {
					copilot = "[Copilot]",
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					snippy = "[Snippy]",
					nvim_lua = "[Lua]",
					path = "[Path]",
					emoji = "[Emoji]",
					spell = "[Spell]",
				},
			}),
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}),
	})
end

local configs = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-emoji",
	"lukas-reineke/cmp-rg",
	"f3fora/cmp-spell",
	{
		"hrsh7th/nvim-cmp",
		config = cmp_setup,
	},

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
}

return configs
