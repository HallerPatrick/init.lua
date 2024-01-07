
local function set_opt(key, value)
    vim.opt[key] = value
end

set_opt("laststatus", 3)
set_opt("termguicolors", true)
set_opt("autoindent", true)
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

set_opt("list", true)
vim.opt.listchars:append("eol:↴")

