local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"
local pid = vim.fn.getpid()

local lspconfig = require "lspconfig"
local servers = {
  -- defaults
  -- "vim-language-server",
  -- "lua-language-server",

  -- webdev
  -- "html-lsp",
  -- "css-lsp",
  -- "tailwindcss-language-server",
  "tsserver",
  "gopls",
  "omnisharp",
  "sqlls",

  -- low level
  "clangd",
  "zls",
  "rust_analyzer",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {}

-- omnisharp (c#)
lspconfig.omnisharp.setup {
  cmd = {
    "/Users/carlos/.local/share/nvim/mason/packages/omnisharp/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(pid),
  },
}

-- gopls
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparems = true,
      },
    },
  },
}
