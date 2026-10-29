local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  {
    src = gh 'tpope/vim-fugitive',
  },
  {
    src = 'idanarye/vim-merginal',
  },
}
