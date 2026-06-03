return {{
  "neovim-treesitter/nvim-treesitter",
  dependencies = {
    "neovim-treesitter/treesitter-parser-registry",
  },
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    ts.install("all") -- may need to have multile `:TSInstall` calls

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if ok and vim.bo.filetype == "php" then
          vim.bo.syntax = "on"   -- use regex coloration _with_ treesitter
        end
      end,
    })
  end,
}}
