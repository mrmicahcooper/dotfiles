return {
  "alaviss/nim.nvim",
  lazy = false,
  config = function()
    vim.cmd([[autocmd FileType nim setlocal foldmethod=manual]])
  end,
}
