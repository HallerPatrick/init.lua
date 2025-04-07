
return {
  -- {
  --   "dracula/vim",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme dracula]])
  --   end,
  -- },
  { 
    "blazkowolf/gruber-darker.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruber-darker]])
      require("plugins.statusline").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
  { "mortepau/codicons.nvim" },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        columns = {"size"},
        watch_for_changes = true,
        view_options = {
          show_hidden = true,
          winbar = "%!v:lua.get_oil_winbar()",
        }
      })
    end,
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         theme = 'gruber-darker'
  --       },
  --       sections = {
  --         lualine_y = {},
  --         lualine_x = { "encoding", "filetype" },
  --       }
  --     }
  --   end
  -- },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '0.1.*',
    build = function() require 'typst-preview'.update() end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "kkoomen/vim-doge",
    build = function()
      vim.cmd(":call doge#install()")
    end,
    config = function()
      vim.g.doge_mapping = "<Leader>d"
      vim.g.doge_doc_standard_python = "google"
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
