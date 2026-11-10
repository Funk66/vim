-- gopls for the Bazel-only nebo monorepo (no go.mod anywhere).
--
-- * gopls gets its package graph from rules_go's gopackagesdriver (via nebazel/tools).
--   The driver rewrites gopls' initial "./..." load to "./<cwd relative to repo root>/...",
--   so the gopls working directory decides how much of the monorepo Bazel analyzes.
-- * The default lspconfig root is the git root, which makes that "./..." cover ~40k targets.
--   Instead, root each gopls at the nearest Bazel package (dir with BUILD/BUILD.bazel).
--   Dependencies are still resolved transitively (go-to-definition works); only unrelated
--   packages are not loaded. "Find references" is limited to the loaded packages.
-- * The repo root is on PATH with `go`/`node` shims that run `bazel run ...`. gopls calls
--   `go env`, which would queue behind (or block) the Bazel server, so gopls gets a PATH
--   without the repo root and uses the real Go toolchain instead.

local repo_markers = { ".nebo.root", "MODULE.bazel", "WORKSPACE.bazel", "WORKSPACE" }

local function repo_root(path)
  -- .nebo.root marks the monorepo; nested MODULE.bazel files (e.g. nebazel/netools) must not win.
  return vim.fs.root(path, ".nebo.root") or vim.fs.root(path, repo_markers)
end

local function go_root_dir(bufnr, on_dir)
  local fname = vim.api.nvim_buf_get_name(bufnr)
  local repo = repo_root(fname)

  if repo then
    -- Bazel monorepo: nearest package boundary, never above the repo root.
    -- A function matcher is needed: a plain list is priority-ordered, so a BUILD.bazel higher
    -- up would win over a nearer BUILD file.
    local pkg = vim.fs.root(fname, function(name)
      return name == "BUILD.bazel" or name == "BUILD"
    end)
    if pkg and vim.startswith(pkg, repo) then
      return on_dir(pkg)
    end
    return on_dir(vim.fs.dirname(fname))
  end

  -- Plain Go project.
  local root = vim.fs.root(fname, "go.work") or vim.fs.root(fname, "go.mod")
  if root then
    return on_dir(root)
  end

  -- Files outside any workspace (GOROOT, module cache, Bazel external repos reached via
  -- go-to-definition): reuse the running client instead of starting a new one.
  local clients = vim.lsp.get_clients({ name = "gopls" })
  if #clients > 0 then
    return on_dir(clients[#clients].config.root_dir)
  end
end

-- PATH without the repo's `go`/`node` Bazel shims.
local function path_without_repo_shims(repo)
  local keep = {}
  for _, p in ipairs(vim.split(vim.env.PATH or "", ":", { plain = true })) do
    if p ~= repo then
      table.insert(keep, p)
    end
  end
  return table.concat(keep, ":")
end

local function gopls_cmd(dispatchers, config)
  local env = vim.fn.environ()
  local repo = config.root_dir and repo_root(config.root_dir)
  if repo then
    local driver = repo .. "/nebazel/tools/gopackagesdriver.sh"
    if vim.uv.fs_stat(driver) then
      env.GOPACKAGESDRIVER = driver
    end
    env.PATH = path_without_repo_shims(repo)
  end
  return vim.lsp.rpc.start({ "gopls" }, dispatchers, {
    cwd = config.cmd_cwd or config.root_dir,
    env = env,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = gopls_cmd,
          root_dir = go_root_dir,
          settings = {
            gopls = {
              -- Never walk Bazel output or JS deps.
              directoryFilters = {
                "-.git",
                "-.idea",
                "-.vscode",
                "-**/node_modules",
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                "-bazel-nebo",
              },
              -- No go.mod, so these codelenses can only error out.
              codelenses = {
                gc_details = false,
                generate = false,
                regenerate_cgo = false,
                run_govulncheck = false,
                tidy = false,
                upgrade_dependency = false,
                vendor = false,
                test = true,
              },
            },
          },
        },
      },
    },
  },
}
