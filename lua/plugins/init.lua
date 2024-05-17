return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- defaults
        "vim-language-server",
        "vimdoc",
        "lua-language-server",
        "stylua",
        "luadoc",

        -- webdev
        "prettier",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "tsserver",
        "gopls",
        "omnisharp",

        -- low level
        "clangd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
