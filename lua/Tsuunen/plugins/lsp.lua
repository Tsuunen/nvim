return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright" }, -- liste de serveurs que tu veux auto-installer
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Utiliser Mason pour setup tous les serveurs automatiquement
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities, -- brancher nvim-cmp aux capacités du LSP
        })
      end
    })
  end
}

