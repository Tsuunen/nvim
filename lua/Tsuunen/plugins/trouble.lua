return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      use_diagnostic_signs = true, -- utilise les icônes du LSP
    })
  end,
  keys = {
    { "<leader>t", "<cmd>Trouble diagnostics<cr>", desc = "Trouble: diagnostics buffer" },
  }
}

