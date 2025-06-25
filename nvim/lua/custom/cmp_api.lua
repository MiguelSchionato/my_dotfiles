local M = {}
M.autocomplete_on = false
M.base_config = {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = require("cmp").config.sources({
    { name = "nvim_lsp" }, { name = "luasnip" },
    { name = "buffer" }, { name = "path" },
  }),
  mapping = {
    ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
    ["<Tab>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then require("cmp").select_next_item() else fallback() end
    end, { "i", "s" }),
    ["<S-Tab>"] = require("cmp").mapping(function(fallback)
      if require("cmp").visible() then require("cmp").select_prev_item() else fallback() end
    end, { "i", "s" }),
  },
}

function M.toggle_autocomplete()
  M.autocomplete_on = not M.autocomplete_on
  local active_config = vim.deepcopy(M.base_config)
  active_config.completion = { autocomplete = M.autocomplete_on }
  require("cmp").setup(active_config)
  if M.autocomplete_on then
    vim.notify("Autocomplete LIGADO", vim.log.levels.INFO, { title = "Cmp" })
  else
    vim.notify("Autocomplete DESLIGADO", vim.log.levels.WARN, { title = "Cmp" })
    require("cmp").close()
  end
end

return M
