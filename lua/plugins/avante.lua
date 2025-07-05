return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- Important for development/latest features
  opts = {
    provider = "copilot",
    providers = {
      copilot = {
        model = "gpt-4.1",
      }, -- Avante will use the copilot.lua plugin you've configured
      -- You can keep Claude as a fallback or remove it if not needed.
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
    -- selector = {
    --   provider = "fzf", -- Requires fzf-lua to be installed
    -- },
    input = {
      provider = "snacks", -- Requires snacks.nvim to be installed
      provider_opts = {
        title = "Avante Input",
        icon = " ",
        placeholder = "Enter your API key...", -- This prompt won't appear for Copilot
      },
    },
    rules = {
      project_dir = '.avante/rules', -- Relative to project root
      global_dir = '~/.config/avante/rules', -- Absolute path
    },
    -- Crucial for neo-tree integration to prevent auto-selecting its buffer
    selector = {
      exclude_auto_select = { "NvimTree" },
    },
  },
  dependencies = {
    -- Core dependencies for avante.nvim
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- Optional: Input/Selector providers and icons (recommended)
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp", -- Needed if you use nvim-cmp for autocompletion
    "ibhagwan/fzf-lua", -- For fzf selector
    "stevearc/dressing.nvim", -- For enhanced input UI
    "folke/snacks.nvim", -- For modern input UI
    "nvim-tree/nvim-web-devicons", -- Or 'echasnovski/mini.icons' for icons

    -- Image pasting support (recommended)
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true, -- Important for Windows compatibility
        },
      },
    },
    -- Markdown rendering for Avante output
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" }, -- Add "Avante" filetype
      },
      ft = { "markdown", "Avante" },
    },
    -- Explicitly NOT listing "zbirenbaum/copilot.lua" here as it's now a top-level plugin
  },
  keys = {
    -- Avante.nvim keybindings in NvimTree
    {
      "<leader>a+",
      function()
        local tree_ext = require("avante.extensions.nvim_tree")
        tree_ext.add_file()
      end,
      desc = "Select file in NvimTree",
      ft = "NvimTree",
    },
    {
      "<leader>a-",
      function()
        local tree_ext = require("avante.extensions.nvim_tree")
        tree_ext.remove_file()
      end,
      desc = "Deselect file in NvimTree",
      ft = "NvimTree",
    },
  },
}
