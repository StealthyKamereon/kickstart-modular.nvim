local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { {
 src = gh 'smoka7/hop.nvim',
  version = vim.version.range '*',
}}
require("hop").setup( { keys = 'etovxqpdygfblzhckisuran'} )
