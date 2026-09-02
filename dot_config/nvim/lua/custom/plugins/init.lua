-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  },
  {
    'smjonas/inc-rename.nvim',
    opts = {},
  },
  {
    'tpope/vim-abolish',
    lazy = false,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
      'rafamadriz/friendly-snippets',
      {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        config = function()
          require('luasnip').setup {
            history = true,
            region_check_events = 'InsertEnter',
            delete_check_events = 'TextChanged,InsertLeave',
          }
        end,
      },
    },
    opts = {
      snippets = { preset = 'luasnip' },
      keymap = { preset = 'super-tab' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
  },
  --{
  --  'epwalsh/obsidian.nvim',
  --  version = '*',
  --  lazy = true,
  --  ft = 'markdown',
  --  dependencies = {
  --    'nvim-lua/plenary.nvim',
  --  },
  --  opts = {
  --    note_id_func = function(title)
  --      -- If a title is provided (e.g., from [[My Note]]), use it, otherwise use a custom default
  --      if title ~= nil then
  --        -- Clean the title: replace spaces with hyphens, remove special chars, lowercase
  --        return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower() .. '-' .. os.date '%Y%m%d'
  --      else
  --        -- Fallback for when no title is provided (e.g., empty [[link]])
  --        -- Example: use a date-based name like "20250308-note"
  --        return os.date '%Y%m%d' .. '-note'
  --      end
  --    end,
  --  },
  --},
  {
    'esmuellert/codediff.nvim',
    cmd = 'CodeDiff',
    keys = {
      { '<leader>gd', '<cmd>CodeDiff<cr>', desc = 'Open CodeDiff' },
      { '<leader>gh', '<cmd>CodeDiff history HEAD~50 %<cr>', desc = 'File History (current)' },
      { '<leader>gH', '<cmd>CodeDiff history<cr>', desc = 'File History (all)' },
    },
    opts = {
      disable_inlay_hints = true,
      cycle_next_hunk = true,
      original_position = 'left',
      explorer = {
        position = 'left',
        width = 25,
        view_mode = 'tree',
        initial_focus = 'explorer',
      },
      history = {
        position = 'bottom',
        height = 16,
      },
      keymaps = {
        view = {
          close = 'q',
          toggle_explorer = '<leader>b',
          next_hunk = ']c',
          prev_hunk = '[c',
          next_file = ']f',
          prev_file = '[f',
          diffget = 'do',
          diffput = 'dp',
          goto_file = 'gf',
          stage_toggle = '-',
        },
        explorer = {
          open = '<CR>',
          preview = 'K',
          refresh = 'R',
          toggle_view = 'i',
          stage_all = 'S',
          unstage_all = 'U',
          discard = 'X',
        },
        history = {
          select = '<CR>',
          toggle_view = 'i',
        },
        conflict = {
          accept_ours = '<leader>co',
          accept_theirs = '<leader>ct',
          accept_both = '<leader>cb',
          discard_both = '<leader>cx',
          next_conflict = ']x',
          prev_conflict = '[x',
          diffget_incoming = '2do',
          diffget_current = '3do',
        },
      },
    },
  },
}
