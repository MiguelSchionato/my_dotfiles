-- ~/.config/nvim/lua/plugins/completion.lua
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local light_cyan = "#73daca" 
      local subtle_bg = "#2e303e"  
      vim.api.nvim_set_hl(0, "CmpPmenu", { fg = light_cyan, bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpPmenuSel", { fg = light_cyan, bg = subtle_bg, bold = true })
      vim.api.nvim_set_hl(0, "CmpPmenuBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = light_cyan, bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = light_cyan, bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#3b4261" })
      cmp.setup({
        completion = {
          autocomplete = false,
        },
        
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = ""
            vim_item.menu = ""
            return vim_item
          end,
        },
        
        window = {
          completion = { border = "none" },
          documentation = { border = "none" },
        },

        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-c>"] = cmp.mapping.abort(),
          ["<Esc>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item() else fallback() end
          end, { "i", "s" }),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, { name = "luasnip" },
          { name = "buffer" }, { name = "path" },
        }),
      })
    end,
  },
}
