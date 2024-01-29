return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')
    dap.adapters.python = function(cb, config)
      local python_path = require("py_lsp.lsp").get_current_python_venv_path()
      if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        })
      else
        cb({
          type = 'executable',
          command = python_path,
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        })
      end
    end
    dap.configurations.python = { {
      -- The first three options are required by nvim-dap
      type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch',
      name = "Launch file",

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}", -- This configuration will launch the current file if used.
      pythonPath = function()
        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        local cwd = vim.fn.getcwd()
        local python_path = require("py_lsp.lsp").get_current_python_venv_path()
        return python_path
        -- vim.print("python_path: " .. python_path)
        -- if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        --   return cwd .. '/venv/bin/python'
        -- elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        --   return cwd .. '/.venv/bin/python'
        -- else
        --   return '/usr/bin/python'
        -- end
      end,
    } }
  end,
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
        dapui.setup({})
      end
    },
    {
      "rcarriga/cmp-dap",
      dependencies = { "nvim-cmp" },
    },
  },
}
