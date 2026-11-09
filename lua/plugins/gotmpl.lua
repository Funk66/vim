vim.filetype.add({
  pattern = {
    -- Must out-rank the builtin `*.tmpl` -> `template` extension match.
    [".*%.%w+%.tmpl"] = { "gotmpl", { priority = 10 } },
  },
})

-- `(#set-lang-from-tmpl-name! @injection.content)`: inject the language of the file name with
-- `.tmpl` stripped (`bundle.cue.tmpl` -> cue). No injection for unknown languages.
vim.treesitter.query.add_directive("set-lang-from-tmpl-name!", function(_, _, bufnr, _, metadata)
  local name = vim.api.nvim_buf_get_name(bufnr):gsub("%.tmpl$", "")
  local ft = vim.filetype.match({ filename = name })
  metadata["injection.language"] = ft and vim.treesitter.language.get_lang(ft) or "comment"
end, { force = true })

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- By default gopls also attaches to `gotmpl` buffers.
        gopls = { filetypes = { "go", "gomod", "gowork" } },
      },
    },
  },
}
