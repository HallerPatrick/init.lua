local M = {}

local statusline = {
  ' %t',
  '%m',
  '%=',
  '%{&filetype}',
  ' %2p%%',
  ' %3l:%-2c '
}


local function format_mode()
  local mode = vim.api.nvim_get_mode().mode
  local mode_map = {
    n = 'GANZ NORMAL',
    i = 'FÜGEN WA EIN',
    c = 'GIB AN',
    v = 'WÄHLEN WA AUS',
    V = 'WÄHLEN WA AUS',
    [''] = 'WÄHLEN WA AUS IM BLOCK',
    R = 'TAUSCHEN WA AUS',
    s = 'SUCHEN WA AUS',
    S = 'SUCHEN WA AUS',
    [''] = 'SUCHEN WA AUS',
  }
  return mode_map[mode]
end

-- Declare a global function to retrieve the current directory
function get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

local function format_filetype()
  local filetype = vim.bo.filetype

  if filetype == "oil" then
    -- Add current directoy to statusline
    return string.format('Oil: %s ', get_oil_winbar())
  end

  return filetype
end

function Statusline()
  local mode = format_mode()
  local filename = vim.fn.expand('%:t')
  local filetype = format_filetype()

  -- return string.format(
  --   ' %s | %s | %s ',
  --   mode,
  --   filename ~= '' and filename or '[No Name]',
  --   filetype ~= '' and filetype or 'no ft'
  -- )

  return table.concat({
    '%#StatusLineMode#',
    string.format(' %s ', mode:upper()),
    '%#StatusLineFilename#',
    string.format(' %s ', filename ~= '' and filename or '[No Name]'),
    '%#StatusLineFiletype#',
    string.format(' %s ', filetype),
    '%#StatusLine#',  -- Reset to default StatusLine highlight
    ' %=',  -- Right-align the rest
    ' %l:%c '  -- L
  })
end



M.setup = function() 
  local palette = require('gruber-darker.palette')
  local highlight_color = palette.yellow:to_string()
  local bg_color = palette["bg+1"]:to_string()
  local white = palette.white:to_string()


  vim.print(highlight)
  vim.cmd(string.format([[
    hi StatusLineMode guibg=%s guifg=%s gui=bold
    hi StatusLineFilename guibg=%s guifg=%s
    hi StatusLineFiletype guibg=%s guifg=%s
  ]], highlight_color, bg_color, bg_color, white, highlight_color, bg_color))
  vim.o.statusline = '%!v:lua.Statusline()'
end

return M
