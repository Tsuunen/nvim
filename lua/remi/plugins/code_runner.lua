return {
  "CRAG666/code_runner.nvim",
  config = function ()
    require('code_runner').setup({
      filetype = {
        go = {"cd $dir &&", "go run ."}
      }
    })
  end,

  keys = {
    {'<leader>=', '<cmd>RunFile<CR>'},
    {'<leader>p', '<cmd>RunProject<CR>'},
    {'<leader>-', '<cmd>RunClose<CR>'},
  }
}
