return {
  "hrsh7th/nvim-cmp",

  -- opts = function()
  --   local cmp = require("cmp")
  --   return {
  --     completion = {
  --       completeopt = "menu,menuone,noinsert",
  --     },
  --     snippet = {
  --       expand = function(args)
  --         require("luasnip").lsp_expand(args.body)
  --       end,
  --     },
  --     mapping = cmp.mapping.preset.insert({
  --       ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --       ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-Space>"] = cmp.mapping.complete(),
  --       ["<C-e>"] = cmp.mapping.abort(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --       ["<S-CR>"] = cmp.mapping.confirm({
  --         behavior = cmp.ConfirmBehavior.Replace,
  --         select = true,
  --       }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --     }),
  --     sources = cmp.config.sources({
  --       { name = "nvim_lsp" },
  --       { name = "luasnip" },
  --       { name = "buffer" },
  --       { name = "path" },
  --     }),
  --     formatting = {
  --       format = function(_, item)
  --         local icons = require("lazyvim.config").icons.kinds
  --         if icons[item.kind] then
  --           item.kind = icons[item.kind] .. item.kind
  --         end
  --         return item
  --       end,
  --     },
  --     experimental = {
  --       ghost_text = {
  --         hl_group = "LspCodeLens",
  --       },
  --     },
  --   }
  -- end
  --@param opts cmp.ConfigSchema
  -- opts = function(_, opts)
  --   local has_words_before = function()
  --     unpack = unpack or table.unpack
  --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --   end
  --
  --   local luasnip = require("luasnip")
  --   local cmp = require("cmp")
  --
  --   opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --     ["<CR>"] = cmp.mapping.confirm({ select = false }),
  --     ["<Tab>"] = cmp.mapping(function(fallback)
  --       if cmp.visible() then
  --         cmp.select_next_item()
  --       elseif luasnip.expand_or_jumpable() then
  --         luasnip.expand_or_jump()
  --       elseif has_words_before() then
  --         cmp.complete()
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" }),
  --     ["<S-Tab>"] = cmp.mapping(function(fallback)
  --       if cmp.visible() then
  --         cmp.select_prev_item()
  --       elseif luasnip.jumpable(-1) then
  --         luasnip.jump(-1)
  --       else
  --         fallback()
  --       end
  --     end, { "i", "s" }),
  --   })
  -- end,

  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
