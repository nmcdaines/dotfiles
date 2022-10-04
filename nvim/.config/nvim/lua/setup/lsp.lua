-- INSPO: https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/lsp.lua

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- WIP >>>>
-- local function config(_config)
--   return vim.tbl_deep_extend("force", {
--     capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--     on_attach = function()

--     end,
--   }, _config or {})
-- end
-- <<<< WIP

capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

cssLanguageServerCmd = "vscode-css-language-server"

-- LSP Server config
require("lspconfig").cssls.setup({
  cmd = { cssLanguageServerCmd, "--stdio" },
  settings = {
    scss = {
      lint = {
        idSelector = "warning",
        zeroUnits = "warning",
        duplicateProperties = "warning",
      },
      completion = {
        completePropertyWithSemicolon = true,
        triggerPropertyValueCompletion = true,
      },
    },
  },
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})
require("lspconfig").tsserver.setup({
  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

require("lspconfig").html.setup({

  -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
})

require("lspconfig").rust_analyzer.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,

  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  },

  -- NOTE: install with
  -- $ rustup +nightly component add rust-analyzer-preview
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
})


require("lspconfig").csharp_ls.setup({

})

-- LSP Prevents inline buffer annotations
-- vim.diagnostic.open_float()
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
--   signs = true,
--   underline = true,
--   update_on_insert = false,
-- })


-- TODO improve the display of errors
local signs = {
  Error = "ﰸ",
  Warn = "",
  Hint = "",
  Info = "",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
end

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])

