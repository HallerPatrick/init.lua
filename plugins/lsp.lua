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

  lspconfig.typst_lsp.setup({
    capabilities = capabilities,
  })
  lspconfig.dartls.setup({
    capabilities = capabilities,
  })
  lspconfig.gopls.setup({
    capabilities = capabilities,
  })
  -- lspconfig.jdtls.setup({
  --   capabilities = capabilities,
  -- })

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
        filetypes = { markdown = true },
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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      ---@alias Provider "openai" | "claude" | "azure" | "deepseek" | "groq"
      provider = "claude",
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20240620",
        temperature = 0,
        max_tokens = 4096,
      },
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          none = "c0",
          both = "cb",
          next = "]x",
          prev = "[x",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
      },
      hints = { enabled = true },
      windows = {
        wrap_line = true,
        width = 30, -- default % based on available width
      },
      --- @class AvanteConflictUserConfig
      diff = {
        debug = false,
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim"
        }
      },
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    dir = "~/Projects/py_lsp.nvim",
    dependencies = { "dharmx/toml.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("py_lsp").setup({
        capabilities = capabilities,
        default_venv_name = "venv",
        language_server = "pyright",
        source_strategies = { "default", "conda" },
        pylsp_plugins = {
          pycodestyle = {
            ignore = { "E501", "E503", "E203" },
            maxLineLength = 120,
          },
        },
        plugins = {
          notify = {
            use = false
          }
        }
      })
    end,
  },
}

return configs
