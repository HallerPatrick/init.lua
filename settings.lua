
local function set_opt(key, value)
    vim.opt[key] = value
end

vim.cmd("filetype plugin indent on")

set_opt("laststatus", 3)
set_opt("termguicolors", true)
set_opt("autoindent", true)
set_opt("smartindent", true)
set_opt("timeoutlen", 300)
set_opt("encoding", "utf-8")
set_opt("scrolloff", 8)
set_opt("hidden", true)
set_opt("relativenumber", true)
set_opt("number", true)
set_opt("shiftwidth", 4)
set_opt("expandtab", true)
set_opt("clipboard", "unnamed,unnamedplus")
set_opt("mouse", "a")

set_opt("wildmenu", true)
set_opt("wildmode", "list:longest")
set_opt(
    "wildignore",
    ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"
)
set_opt("incsearch", true)
set_opt("ignorecase", true)
set_opt("smartcase", true)
set_opt("gdefault", true)
set_opt("ttyfast", true)
set_opt("lazyredraw", true)
set_opt("completeopt", "menuone,noinsert,noselect")
set_opt("tabstop", 4)
set_opt("cmdheight", 2)
set_opt("updatetime", 300)
set_opt("signcolumn", "yes")
set_opt("swapfile", false)
set_opt("undofile", true)


set_opt("spell", false)
set_opt("spelllang", { 'en_us' })

set_opt("list", true)
vim.opt.listchars:append("eol:↴")

set_opt("shell", "/bin/zsh")

vim.api.nvim_create_autocmd("FileType",{
  pattern = {"tex", "lua", "cpp"},
  command = [[ setlocal shiftwidth=2 softtabstop=2 expandtab ]]
})

vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format()
end, {})

vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
    local dap = require("dap")
	-- :help nvim_create_user_command
	local args = vim.split(vim.fn.expand(t.args), '\n')
	local approval = vim.fn.confirm(
		"Will try to run:\n    " ..
		vim.bo.filetype .. " " ..
		vim.fn.expand('%') .. " " ..
		t.args .. "\n\n" ..
		"Do you approve? ",
		"&Yes\n&No", 1
	)
	if approval == 1 then
		dap.run({
			type = vim.bo.filetype,
			request = 'launch',
			name = 'Launch file with custom arguments (adhoc)',
			program = '${file}',
			args = args,
		})
	end
end, {
	complete = 'file',
	nargs = '*'
})

vim.keymap.set('n', '<leader>da', ":RunScriptWithArgs ")

-- require("lua.plugins.statusline").setup()

