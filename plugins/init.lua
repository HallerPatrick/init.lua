local treesitter_configs = require("plugins.treesitter")
local telescope_configs = require("plugins.telescope")
local cmp_configs = require("plugins.cmp")
local lsp_configs = require("plugins.lsp")
local neoscroll_configs = require("plugins.neoscroll")
local comment_configs = require("plugins.comment")
local ssh_config = require("plugins.ssh")
local iron_config = require("plugins.iron")
local git_config = require("plugins.git")
local autopairs_config = require("plugins.autopairs")
local dap_config = require("plugins.dap")
local others_config = require("plugins.others")

local plugins = {
  others_config,
  treesitter_configs.treesitter,
  treesitter_configs.treesitter_textobjects,
  telescope_configs.telescope,
  telescope_configs.harpoon,
  cmp_configs,
  lsp_configs,
  neoscroll_configs,
  comment_configs,
  ssh_config,
  iron_config,
  git_config,
  autopairs_config,
  -- dap_config
}

return plugins
