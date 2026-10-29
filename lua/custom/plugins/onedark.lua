local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { {
  src = gh 'navarasu/onedark.nvim',
}}
require("onedark").setup( {style = "dark"})
require("onedark").load()
