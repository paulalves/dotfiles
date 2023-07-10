
local gruvbox = require'lualine.themes.gruvbox'

local colors = {
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  yellow       = '#fe8019',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
}

gruvbox.normal = {
   a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
   b = { bg = colors.lightgray, fg = colors.white },
   c = { bg = colors.inactivegray, fg = colors.black },
}
 
gruvbox.visual = { 
   a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
   b = { bg = colors.lightgray, fg = colors.white },
   c = { bg = colors.darkgray, fg = colors.gray },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = gruvbox
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  },
 }
