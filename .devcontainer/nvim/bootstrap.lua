-- Headless bootstrap: sync plugins, install Mason tools and treesitter parsers,
-- and block until every async installer is done. Exits non-zero on failure.
local failed = {}

local function fail(msg)
  table.insert(failed, msg)
end

local function opts_of(name)
  local plugin = require("lazy.core.config").plugins[name]
  return plugin and require("lazy.core.plugin").values(plugin, "opts", false) or {}
end

require("lazy").sync({ wait = true, show = false })

-- Mason
require("lazy").load({ plugins = { "mason.nvim" } })
local registry = require("mason-registry")
local tools = vim.list_extend({ "tree-sitter-cli" }, opts_of("mason.nvim").ensure_installed or {})
local refreshed = false
registry.refresh(function()
  refreshed = true
end)
vim.wait(60000, function()
  return refreshed
end, 100)

local pending = {}
for _, name in ipairs(tools) do
  local ok, pkg = pcall(registry.get_package, name)
  if not ok then
    fail("mason: unknown package " .. name)
  elseif not pkg:is_installed() then
    pkg:install()
    table.insert(pending, pkg)
  end
end
vim.wait(900000, function()
  return vim.iter(pending):all(function(p)
    return not p:is_installing()
  end)
end, 500)
for _, name in ipairs(tools) do
  local ok, pkg = pcall(registry.get_package, name)
  if ok and not pkg:is_installed() then
    fail("mason: failed to install " .. name)
  end
end

-- Treesitter (needs tree-sitter-cli from Mason on PATH)
local parsers = opts_of("nvim-treesitter").ensure_installed or {}
local ok, err = pcall(function()
  require("nvim-treesitter").install(parsers):wait(900000)
end)
if not ok then
  fail("treesitter: " .. tostring(err))
end

if #failed > 0 then
  io.stderr:write("bootstrap failed:\n  " .. table.concat(failed, "\n  ") .. "\n")
  vim.cmd("cquit 1")
end
vim.cmd("qa!")
