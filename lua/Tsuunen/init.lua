require("Tsuunen.set")
require("Tsuunen.lazy")
require'lspconfig'.emmet_ls.setup({
  filetypes = {
    'html', 'css', 'php', 'javascriptreact', 'typescriptreact',
    'vue', 'svelte', 'xml'
  },
  init_options = {
    html = {
      options = {
        ['bem.enabled'] = true,
      },
    },
  }
})

