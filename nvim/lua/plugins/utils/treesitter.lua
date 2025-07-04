return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "python", "javascript", "bash", "go", "terraform", "ssh_config", "fish"
      },
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
           end
          end,
         additional_vim_regex_highlighting = false,
      },
     },
      config = function(_, opts)
       require('nvim-treesitter.configs').setup(opts)
   end,
  }
}
