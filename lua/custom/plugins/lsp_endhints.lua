local function gh(repo) return 'https://github.com/' .. repo end

-- Display inlay hints at the end of the line.
vim.pack.add { {
  src = gh 'chrisgrieser/nvim-lsp-endhints',
  event = 'LspAttach',
} }
