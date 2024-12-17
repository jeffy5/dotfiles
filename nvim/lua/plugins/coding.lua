return {
  -- Extra plugins
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  { import = "lazyvim.plugins.extras.ai.codeium" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.kotlin" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.yaml" },

  -- Add plugin for flutter
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = { "dart" },
    -- lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },

  -- Fix codeium incorrect tips, [Blink Compat Issues 18](https://github.com/Saghen/blink.compat/issues/18)
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
      sources = {
        providers = {
          codeium = {
            kind = "Codeium",
            score_offset = 100,
            async = true,
            override = {
              get_keyword_pattern = function(self)
                return [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]]
              end,
            },
          },
        },
      },
    },
  },

  -- Disable inlay hints
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  -- Reset for surround keymap, works like vim-surround
  {
    "echasnovski/mini.surround",
    opts = function(_, opts)
      opts.mappings = {
        add = "",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",

        -- Add this only if you don't want to use extended mappings
        suffix_last = "",
        suffix_next = "",
      }
      opts.search_method = "cover_or_next"
      vim.keymap.set("x", "S", [[:<C-u>lua require('mini.surround').add('visual')<CR>]], { silent = true })
    end,
  },

  -- Disable S keymap
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "S", mode = { "x", "n", "o" }, false },
      {
        "<leader>ts",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}
