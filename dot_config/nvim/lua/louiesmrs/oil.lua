require('oil').setup {
  columns = { 'icon' },
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  keymaps = {
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<C-k>'] = false,
    ['<C-j>'] = false,
    ['<M-h>'] = 'actions.select_split',
  },
}

-- Open parent directory in current window
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Open parent directory in floating window
vim.keymap.set('n', '<space>-', require('oil').toggle_float)
