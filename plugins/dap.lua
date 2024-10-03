return {
  "mfussenegger/nvim-dap",
  -- config = function()
  --   local dap = require('dap')
  --   dap.adapters.python = function(cb, config)
  --     if config.request == 'attach' then
  --       ---@diagnostic disable-next-line: undefined-field
  --       local port = (config.connect or config).port
  --       ---@diagnostic disable-next-line: undefined-field
  --       local host = (config.connect or config).host or '127.0.0.1'
  --       cb({
  --         type = 'server',
  --         port = assert(port, '`connect.port` is required for a python `attach` configuration'),
  --         host = host,
  --         options = {
  --           source_filetype = 'python',
  --         },
  --       })
  --     else
  --       cb({
  --         type = 'executable',
  --         command = require("py_lsp.lsp").get_current_python_venv_path(),
  --         args = { '-m', 'debugpy.adapter' },
  --         options = {
  --           source_filetype = 'python',
  --         },
  --       })
  --     end
  --   end
  --   dap.configurations.python = { {
  --     -- The first three options are required by nvim-dap
  --     type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
  --     request = 'launch',
  --     name = "Launch file",
  --     program = "${file}", -- This configuration will launch the current file if used.
  --     pythonPath = function()
  --       return require("py_lsp.lsp").get_current_python_venv_path()
  --     end,
  --   } }
  -- end,

  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { handlers = {} },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
        dapui.setup({
          layouts = { {
            elements = { {
              id = "breakpoints",
              size = 0.5
            }, {
              id = "watches",
              size = 0.5
            } },
            position = "left",
            size = 50
          }, {
            elements = { {
              id = "repl",
              size = 1.0
            } },
            position = "bottom",
            size = 20
          } },
        })
      end
    },
    {
      "theHamsta/nvim-dap-virtual-text", -- virtual text
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
    },
  },
}
