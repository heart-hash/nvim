return {

  {
    "mbbill/undotree",
    lazy = false, -- needs to be explicitly set, because of the keys property
    cmd = {
      "UndotreeToggle",
    },
  },
  -- Override plugin definition options

  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {
      lsp = {
        override = {
          -- Fix WARNING `vim.lsp.util.convert_input_to_markdown_lines` and `vim.lsp.util.stylize_markdown`
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,  -- Ensure you have hrsh7th/nvim-cmp installed
        },
        -- Fix ERROR conflicts by disabling hover and signature in Noice if they are managed by another plugin
        hover = {
          enabled = false, -- Disables Noice handling for hover if another plugin manages it
        },
        signature = {
          enabled = false, -- Disables Noice handling for signature help if another plugin manages it
        },
      },
      presets = {
      },
      views = {
        cmdline_popup = {
          position = {
            row = 20,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 23,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
    },

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>F",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon file",
      },
      {
        "<leader>f",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>P",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon to prev file",
      },
      {
        "<leader>N",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon to next file",
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "eslint-lsp",
        "html-lsp",
        "css-lsp",
        "prettier",

        -- c/cpp
        "clangd",
        "clang-format",

        -- shell
        "shfmt",
        "pyright",
        "rust-analyzer",
        "yaml-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "javascript",
      },
    },
  },
}
