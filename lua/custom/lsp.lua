local lsp_enabled = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  nixd = {
    settings = {
      nixd = {
        nixpkgs = {
          expr = 'import <nixpkgs> { }',
        },
        formatting = {
          command = { 'alejandra' }, -- or nixfmt or nixpkgs-fmt
        },
      },
    },
  },
}

for lsp, settings in pairs(lsp_enabled) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, settings)
end
