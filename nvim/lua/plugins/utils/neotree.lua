return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    window = {  
      position = "left",
      width = 30,
  },
    event_handlers = {
      {
      event = "file_opened",
      handler = function(file_path)
      require("neo-tree.command").execute({ toggle = true })
   end,
    },
    },
    filesystem = {   
      filtered_items = {
        hide_dotfiles = false,
      },
    },
  },
}
