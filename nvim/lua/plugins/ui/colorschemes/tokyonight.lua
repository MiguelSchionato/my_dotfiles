-- lua/plugins/tokyonight.lua
return {
  {
  "folke/tokyonight.nvim",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
  opts = { 
    on_colors = function (colors)
     colors.green = "#a9b1d6"
     colors.green_bright = "#a9b1d6"
     colors.fg = "#c5e4e7"
   end,

    on_highlights = function(highlights, colors)
      highlights.String = {fg = "#3e68d7"}
      highlights.Comment = {italic = true, fg = "#394b70"}
      highlights["@field"] = { fg = "#a9b1d6" }
      highlights["@variable.member"] = { fg = "#0db9d7" }
      highlights["@variable.name"] = { fg = "#0db9d7" }
      highlights["@property"] = { fg = "#0db9d7" }
   end,
   },  

   config = function (_, opts)
     require("tokyonight").setup(opts)
   end,
  },
}
