vim.opt.timeoutlen = 600

vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
-- vim.keymap.set('n', 'gb', '<C-o>')
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', "<cmd>lua require('vscode').action('workbench.action.focusLeftGroup')<CR>", { desc = 'Move focus to the left group' })
vim.keymap.set('n', '<C-l>', "<cmd>lua require('vscode').action('workbench.action.focusRightGroup')<CR>", { desc = 'Move focus to the left group' })
vim.keymap.set('n', '<C-j>', "<cmd>lua require('vscode').action('workbench.action.focusBelowGroup')<CR>", { desc = 'Move focus to the left group' })
vim.keymap.set('n', '<C-k>', "<cmd>lua require('vscode').action('workbench.action.focusAboveGroup')<CR>", { desc = 'Move focus to the left group' })
-- Editor pane resizing
vim.keymap.set('n', '<C-,>', "<cmd>lua require('vscode').action('workbench.action.decreaseViewWidth')<CR>", { desc = 'Decrease editor width' })
vim.keymap.set('n', '<C-.>', "<cmd>lua require('vscode').action('workbench.action.increaseViewWidth')<CR>", { desc = 'Increase editor width' })
vim.keymap.set('n', '<C-s>', "<cmd>lua require('vscode').action('workbench.action.decreaseViewHeight')<CR>", { desc = 'Decrease editor height' })
vim.keymap.set('n', '<C-t>', "<cmd>lua require('vscode').action('workbench.action.increaseViewHeight')<CR>", { desc = 'Increase editor height' })
--local keymap = vim.keymap.set
--local opts = { noremap = true, silent = true }
--
---- remap leader key
--keymap('n', '<Space>', '', opts)
--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
--
---- yank to system clipboard
--keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)
--
---- paste from system clipboard
--keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)
--
---- better indent handling
--keymap('v', '<', '<gv', opts)
--keymap('v', '>', '>gv', opts)
--
---- move text up and down
--keymap('v', 'J', ':m .+1<CR>==', opts)
--keymap('v', 'K', ':m .-2<CR>==', opts)
--keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
--keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
--
---- paste preserves primal yanked piece
--keymap('v', 'p', '"_dP', opts)
--
---- removes highlighting after escaping vim search
--keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)
---- call vscode commands from neovim
--
---- general keymaps
--keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
--keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
--keymap({ 'n', 'v' }, '<leader>d', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
--keymap({ 'n', 'v' }, '<leader>a', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
--keymap({ 'n', 'v' }, '<leader>sp', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
--keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
--keymap({ 'n', 'v' }, '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
--keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
--keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
--keymap({ 'n', 'v' }, '<leader>fd', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
--
---- harpoon keymaps
--keymap({ 'n', 'v' }, '<leader>ha', "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
--keymap({ 'n', 'v' }, '<leader>ho', "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
--keymap({ 'n', 'v' }, '<leader>he', "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
--keymap({ 'n', 'v' }, '<leader>h1', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
--keymap({ 'n', 'v' }, '<leader>h2', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
--keymap({ 'n', 'v' }, '<leader>h3', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
--keymap({ 'n', 'v' }, '<leader>h4', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
--keymap({ 'n', 'v' }, '<leader>h5', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
--keymap({ 'n', 'v' }, '<leader>h6', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
--keymap({ 'n', 'v' }, '<leader>h7', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
--keymap({ 'n', 'v' }, '<leader>h8', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
--keymap({ 'n', 'v' }, '<leader>h9', "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")
--
---- project manager keymaps
--keymap({ 'n', 'v' }, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
--keymap({ 'n', 'v' }, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
--keymap({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
