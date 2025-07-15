-- Config to handle lsp custom lsp integration.

local function enable_lsps(servers, capabilities)
  for _, server_name in ipairs(servers) do
    local server = servers[server_name] or {}
    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
    require('lspconfig')[server_name].setup(server)
  end
end

return enable_lsps
