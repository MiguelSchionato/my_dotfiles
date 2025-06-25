-- lua/plugins/kanagawa.lua

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "wave",
    overrides = function(colors)
      local theme = colors.theme
      return {
      String = { fg = colors.palette.lotusBlue4},
    }
end,
},
  config = function(_, opts)
    require("kanagawa").setup(opts)
    end,
}
