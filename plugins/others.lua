return {
  {
    "dracula/vim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme dracula]])
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
      require("oil").setup({})
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'dracula'
        },
        sections = {
          lualine_y = {},
          lualine_x = { "encoding", "filetype" },
        }
      }
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
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
    config = function()
      vim.cmd(":call doge#install()")
      vim.g.doge_mapping = "<Leader>d"
      vim.g.doge_doc_standard_python = "google"
    end
  }
}
