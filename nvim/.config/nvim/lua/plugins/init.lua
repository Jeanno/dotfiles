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
      -- First load your LSP configurations
      require("lsp")

      -- Set up keybindings via on_attach function
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'K', function()
          local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
          if #diagnostics > 0 then
            vim.diagnostic.open_float()
          else
            vim.lsp.buf.hover()
          end
        end, { desc = 'Contextual: diagnostics or hover' })

        -- Auto-formatting (updated for Neovim 0.11)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              -- Use the new format API instead of formatting_sync (which is deprecated)
              if vim.bo.filetype == "python" or vim.bo.filetype == "javascriptreact" then
                vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
              end
            end,
          })
        end
      end

      -- Apply on_attach to all language servers
      local servers = {'ts_ls', 'pyright', 'gopls', 'sourcekit', 'bashls', 'jsonls', 'eslint'}
      for _, lsp in ipairs(servers) do
        require('lspconfig')[lsp].setup({
          on_attach = on_attach,
          -- other settings can be added here
        })
      end
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-3.7-sonnet",
      sticky = {
        -- '#files',
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      -- Set up keybindings
      vim.keymap.set({ "n", "v" }, "<leader>ss", function()
        chat.open()
      end, { noremap = true, silent = true })
    end,
    -- See Commands section for default commands if you want to lazy load on them
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
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
}

-- Export the plugin list to Lazy.nvim
return plugins
