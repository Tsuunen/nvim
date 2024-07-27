return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {"hrsh7th/cmp-buffer", name="buffer"},
    {"hrsh7th/cmp-path", name="path"},
    {"L3MON4D3/LuaSnip", version="v2.*", build="make install_jsregexp"},
    {"saadparwaiz1/cmp_luasnip", name="luasnip"},
    {"rafamadriz/friendly-snippets", name="friendly_snippets"},
    {"onsails/lspkind.nvim", name="lspkind"}
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
        formatting_fields = {"menu", "_kind"}
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), -- next suggestion
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      ["<C-e>"] = cmp.mapping.abort(), -- close completion window
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
      {name="nvim_lsp", max_item_count = 5},
      {name="luasnip", max_item_count = 5}, -- snippets
      {name="buffer", max_item_count = 5}, -- text within current buffer
      {name="path", max_item_count = 5}, -- file system paths
    }),

    formatting = {
      format = lspkind.cmp_format({
        ellipsis_char = "...",
        fields = {"menu", "_kind"}
      }),
    }
  })
end,
}

