-- In lua/plugins.lua
local plugins = {
  -- UI
  {
    "itchyny/lightline.vim",
    lazy = false,
  },

--   -- Lint and Syntax
--   {
--     "dense-analysis/ale",
--     event = { "BufReadPre", "BufNewFile" },
--   },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp")
    end,
  },

  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },
  {
    "github/copilot.vim",
  },

  -- Files
  {
    "junegunn/fzf.vim",
    dependencies = { { "junegunn/fzf", build = ":call fzf#install()" } },
    cmd = { "FZF", "Files", "Ag" },
  },

  -- Git
  { "tpope/vim-fugitive", cmd = { "G", "Git" } },
  { "airblade/vim-gitgutter", event = "BufReadPost" },

  -- { "nvim-lua/plenary.nvim" },

  -- Enhancements
  { "tpope/vim-surround", event = "BufReadPost" },
  { "unblevable/quick-scope", event = "BufReadPost" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-commentary", keys = { "gc", "gcc" } },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent = { enabled = true },
      notifier = { enabled = true },
      scroll = {
        animate = {
          duration = { step = 20, total = 60 },
          easing = "linear",
        },
      }
    },
  },
}

-- Export the plugin list to Lazy.nvim
return plugins
