-- Git keymap
vim.keymap.set('n', '<leader>gg', ':G<Enter>', { desc = 'Open fugitive window' })
vim.keymap.set('n', '<leader>gm', ':Merginal<Enter>', { desc = 'Open merginal window' })

-- Spider (CamelCaseMotions) keymaps
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>w', "<cmd>lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>e', "<cmd>lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>b', "<cmd>lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>ge', "<cmd>lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })

-- Motions
vim.keymap.set({ 'n', 'o', 'x' }, '<leader><leader>', ':HopWord<Enter>', { desc = 'Jump to any word' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>jl', ':HopLineStart<Enter>', { desc = 'Jump to line start' })
vim.keymap.set({ 'n', 'o', 'x' }, '<leader>jk', ':HopChar2<Enter>', { desc = 'Jump to two matching chars' })
local hop = require 'hop'
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true })

-- Projects
vim.keymap.set('n', '<leader>ph', ':NeovimProjectHistory<Enter>', { desc = 'Open projects history' })
vim.keymap.set('n', '<leader>pd', ':NeovimProjectDiscover<Enter>', { desc = 'Discover projects' })

-- Paste yanked directly
vim.keymap.set('n', 'gp', '"0p', { desc = 'Past yanked on current line' })
vim.keymap.set('n', 'gP', '"0P', { desc = 'Past yanked on previous line' })

-- Telescope
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- Show error under cursor
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Close all buffers but the current one
vim.keymap.set('n', '<leader>c', ':%bd|e#<Enter>', { desc = '[C]lose every other buffers' })
