vim.opt_local.iskeyword:append("$")
vim.g.PHP_noArrowMatching = 1

vim.api.nvim_create_augroup("php", {clear=true})
vim.api.nvim_create_autocmd({"BufNewFile","BufReadPre"}, {
  group="php",
  pattern = {"*.php"},
  callback = function()
    vim.api.nvim_set_hl(0, "phpDocTags", {link="phpDefine"})
    vim.api.nvim_set_hl(0, "phpDocParam", {link="phpType"})
  end,
})
