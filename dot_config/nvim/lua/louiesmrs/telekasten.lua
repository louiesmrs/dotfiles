local home = vim.fn.expand '~/Documents/louie.somers'

require('telekasten').setup {
  media_previewer = 'viu-previewer',
  home = home,
  dailies = home .. '/' .. 'daily',
  weeklies = home .. '/' .. 'weekly',
  templates = home .. '/' .. 'templates',

  -- image subdir for pasting
  -- subdir name
  -- or nil if pasted images shouldn't go into a special subdir
  image_subdir = nil,

  -- markdown file extension
  extension = '.md',

  -- following a link to a non-existing note will create it
  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,

  -- templates for new notes
  template_new_note = home .. '/' .. 'templates/new_note.md',
  template_new_daily = home .. '/' .. 'templates/daily_tk.md',
  template_new_weekly = home .. '/' .. 'templates/weekly_tk.md',

  -- image link style
  -- wiki:     ![[image name]]
  -- markdown: ![](image_subdir/xxxxx.png)
  image_link_style = 'markdown',

  -- integrate with calendar-vim
  plug_into_calendar = true,
  calendar_opts = {
    -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    weeknm = 4,
    -- use monday as first day of week: 1 .. true, 0 .. false
    calendar_monday = 1,
    -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    calendar_mark = 'left-fit',
  },
  debug = false,

  close_after_yanking = false,
  insert_after_inserting = true,

  -- make syntax available to markdown buffers and telescope previewers
  install_syntax = true,

  -- tag notation: '#tag', ':tag:', 'yaml-bare'
  tag_notation = '#tag',

  -- command palette theme: dropdown (window) or ivy (bottom panel)
  command_palette_theme = 'ivy',
}

local telekasten = require 'telekasten'

vim.keymap.set('n', '<leader>nf', telekasten.find_notes, { desc = 'find notes', remap = false })
vim.keymap.set('n', '<leader>nD', telekasten.find_daily_notes, { desc = 'find daily notes', remap = false })
vim.keymap.set('n', '<leader>ng', telekasten.search_notes, { desc = 'g search notes', remap = false })
vim.keymap.set('n', '<leader>nz', telekasten.follow_link, { desc = 'z follow link', remap = false })
vim.keymap.set('n', '<leader>nd', telekasten.goto_today, { desc = 'goto today', remap = false })
vim.keymap.set('n', '<leader>nW', telekasten.goto_thisweek, { desc = 'goto this Week', remap = false })
vim.keymap.set('n', '<leader>nw', telekasten.find_weekly_notes, { desc = 'find weekly notes', remap = false })
vim.keymap.set('n', '<leader>nn', telekasten.new_note, { desc = 'new note', remap = false })
vim.keymap.set('n', '<leader>nN', telekasten.new_templated_note, { desc = 'new templated note', remap = false })
vim.keymap.set('n', '<leader>ny', telekasten.yank_notelink, { desc = 'yank note link', remap = false })
vim.keymap.set('n', '<leader>nc', telekasten.show_calendar, { desc = 'show calendar', remap = false })
vim.keymap.set('n', '<leader>ni', telekasten.paste_img_and_link, { desc = 'paste image and link', remap = false })
vim.keymap.set('n', '<leader>nt', telekasten.toggle_todo, { desc = 'toggle todo', remap = false })
vim.keymap.set('n', '<leader>nb', telekasten.show_backlinks, { desc = 'show backlinks', remap = false })
vim.keymap.set('n', '<leader>nF', telekasten.find_friends, { desc = 'find Friend notes', remap = false })
vim.keymap.set('n', '<leader>np', telekasten.preview_img, { desc = 'preview image', remap = false })
vim.keymap.set('n', '<leader>nm', telekasten.browse_media, { desc = 'browse media', remap = false })
-- panel not required in kickstart b/c whichkeys
-- vim.keymap.set('n', '<leader>n', telekasten.panel, { desc='', remap = false })
vim.keymap.set('n', '<leader>na', telekasten.show_tags, { desc = 'show tags', remap = false })

vim.keymap.set('n', '<leader>nC', '<cmd>CalendarT<CR>', { desc = 'show big Calendar', remap = false })

vim.keymap.set('n', '<leader>nI', function()
  telekasten.insert_img_link { i = true }
end, { desc = 'insert image link', remap = false })

vim.keymap.set('n', '<leader>nr', function()
  require('plenary.reload').reload_module 'telekasten'
end, { desc = 'reload Telekasten', remap = false })

-- " note: we define [[ in **insert mode** to call insert link
-- " note: we don't do this anymore - maybe it makes sense to limit to markdown
-- " mode
--
-- ,[ -> insert link
vim.keymap.set('i', ',[', function()
  telekasten.insert_link { i = true }
end, { remap = false })

-- ,# -> insert tag
vim.keymap.set('i', ',#', function()
  telekasten.show_tags { i = true }
end, { remap = false })

-- ,zt -> toggle todo
vim.keymap.set('i', ',zt', function()
  telekasten.toggle_todo { i = true }
end, { remap = false })

-- noremap <leader>P :MarkdownPreviewToggle<CR>

-- Autocommand to set the syntax for markdown files
-- disabled
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = function()
--     vim.opt_local.syntax = 'telekasten'
--   end,
-- })

-- Autocommand to map <CR> for telekasten filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'telekasten',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', ":lua require('telekasten').follow_link()<CR>", { noremap = true, silent = true })
  end,
})

-- Disable signcolumn for calendar filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'calendar',
  callback = function()
    vim.opt_local.signcolumn = 'no'
  end,
})

-- Highlight groups definition
-- Highlight for tklink
vim.api.nvim_set_hl(0, 'tklink', {
  ctermfg = 72,
  fg = '#689d6a',
  bold = true,
  underline = true,
})

-- Highlight for tkBrackets
vim.api.nvim_set_hl(0, 'tkBrackets', {
  ctermfg = 'gray',
  fg = 'gray',
})

-- Highlight for tkHighlight (real yellow)
vim.api.nvim_set_hl(0, 'tkHighlight', {
  ctermbg = 'yellow',
  ctermfg = 'darkred',
  bg = 'yellow',
  fg = 'darkred',
  bold = true,
})

-- Highlight for tkHighlight (gruvbox)
vim.api.nvim_set_hl(0, 'tkHighlight', {
  ctermbg = 214,
  ctermfg = 124,
  bg = '#fabd2f',
  fg = '#9d0006',
  bold = true,
})

-- Linking highlight group CalNavi to CalRuler
vim.api.nvim_set_hl(0, 'CalNavi', {
  link = 'CalRuler',
})

-- Highlight for tkTagSep
vim.api.nvim_set_hl(0, 'tkTagSep', {
  ctermfg = 'gray',
  fg = 'gray',
})

-- Highlight for tkTag
vim.api.nvim_set_hl(0, 'tkTag', {
  ctermfg = 175,
  fg = '#d3869B',
})
