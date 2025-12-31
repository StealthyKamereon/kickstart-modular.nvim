local local_lsp_enabled = require 'custom.lsp_servers'
local global_lsp_enabled = {
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
  tinymist = {},
}

local function try_find_and_load_lsp_config()
  local file_path = vim.fn.getcwd() .. '/lsp-config.json'
  local file = io.open(file_path, 'r')
  if file then
    local content = file:read '*a'
    file:close()
    content = vim.fn.json_decode(content)
    return content
  end
end

local function tableMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == 'table' then
      if type(t1[k] or false) == 'table' then
        tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

local lsp_override = try_find_and_load_lsp_config() or {}
local lsp_settings = tableMerge(global_lsp_enabled, local_lsp_enabled)
local lsp_settings = tableMerge(lsp_settings, lsp_override)

for lsp, settings in pairs(lsp_settings) do
  vim.lsp.config(lsp, settings)
  vim.lsp.enable(lsp)
end
