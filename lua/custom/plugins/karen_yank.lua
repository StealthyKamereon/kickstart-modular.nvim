local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'tenxsoydev/karen-yank.nvim',
}

require('karen-yank').setup {
  mappings = {
    karen = 'y',
  },
}
