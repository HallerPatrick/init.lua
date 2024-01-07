
vim.cmd("filetype plugin indent on")

function set_opt(scope, key, value)
    vim.opt[key] = value
end

set_opt("o", "laststatus", 3)
set_opt("o", "termguicolors", true)
set_opt("o", "autoindent", true)
set_opt("o", "timeoutlen", 300)
set_opt("o", "encoding", "utf-8")
set_opt("o", "scrolloff", 8)
set_opt("o", "hidden", true)
set_opt("o", "relativenumber", true)
set_opt("o", "number", true)
set_opt("o", "shiftwidth", 4)
set_opt("o", "expandtab", true)
set_opt("o", "clipboard", "unnamed,unnamedplus")
set_opt("o", "mouse", "a")

set_opt("o", "wildmenu", true)
set_opt("o", "wildmode", "list:longest")
set_opt(
    "o",
    "wildignore",
    ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"
)
set_opt("o", "incsearch", true)
set_opt("o", "ignorecase", true)
set_opt("o", "smartcase", true)
set_opt("o", "gdefault", true)
set_opt("o", "ttyfast", true)
set_opt("o", "lazyredraw", true)
set_opt("o", "completeopt", "menuone,noinsert,noselect")
set_opt("o", "tabstop", 4)
set_opt("o", "cmdheight", 2)
set_opt("o", "updatetime", 300)
set_opt("o", "signcolumn", "yes")

vim.api.nvim_create_autocmd("FileType",{
  pattern = {"tex", "lua", "cpp"},
  command = [[ setlocal shiftwidth=2 softtabstop=2 expandtab ]]
})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = augroup,
  command = [[ silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700} ]],
  desc = 'highglight yanked group'
})
