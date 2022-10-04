local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      { "i", "c" }
    ),
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "vsnip" },
    { name = "buffer" },

    -- results that may match
    -- { name = "look", keyword_length = 3, option = { convert_case = true, loud = true } },
    { name = "nvim_lua" },
    -- { name = "calc" },
    -- { name = "emoji" },
    
    -- props will re-enable this
    -- { name = "path" },
    
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "",
        nvim_lsp = "",
        spell = "",
        look = "",
      },
    }),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})

-- cmp.setup.cmdline("/", {
--   sources = {
--     { name = "buffer" },
--   },
-- })

-- cmp.setup.cmdline(":", {
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })


require("luasnip.loaders.from_vscode").lazy_load()


local ls = require("luasnip")
local f = ls.function_node
local postfix = require("luasnip.extras.postfix").postfix


ls.add_snippets("all", {
  postfix(".llog", {
    f(function(_, parent)
      return "console.log(\"" .. parent.snippet.env.POSTFIX_MATCH  .. "\", " .. parent.snippet.env.POSTFIX_MATCH .. ");"
    end, {}),
  })
})

