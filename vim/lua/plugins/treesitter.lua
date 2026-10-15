return {{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter"
    local langs = { 
      -- day to day
      'php', 'phpdoc', 
      'javascript', 'dockerfile', 'typescript', 'yaml', 'json', 'json5', 'make', 'sql',
      'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore',  -- git stuff
      'go', 'gomod', 'gosum', 'gotmpl', 'gowork',  -- go stuff
      'zsh', 'bash', 'fish', 'awk', 'editorconfig', 'gpg', 'ssh_config', -- tools

      -- other
      'c', 'c_sharp', 'caddy', 'cpp', 'css', 'csv', 'helm', 'html', 'http',
      'latex', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'nginx', 'printf',
      'comment', 'python', 'regex', 'ruby', 'rust', 'scss', 'tsx', 'vim', 'vimdoc', 
      'xml',
    }

    ts.install(langs)

    local fts = {}
    for _, lang in ipairs(langs) do
      vim.list_extend(fts, vim.treesitter.language.get_filetypes(lang))
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = fts,
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if ok and vim.bo.filetype == "php" then
          vim.bo.syntax = "on"   -- use regex coloration _with_ treesitter
        end
      end,
    })
  end,
}}
