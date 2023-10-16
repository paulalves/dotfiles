require('telescope').setup {
  defaults = {
     vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    },
    file_ignore_patterns = {
      ".git/*",
      "bin/*",
      "obj/*",
      "node_modules/*",
      "dist/*",
      "build/*",
      "target/*",
      "vendor/*",
      "Pods/*",
      ".*.swp",
    }
  }
}
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
