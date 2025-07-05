return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  -- You'll run ":Copilot auth" manually later, but this ensures the build step is available.
  build = ":Copilot auth",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        dismiss = "<C-c>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75, -- Milliseconds to wait after last keypress before showing suggestion
      keymap = {
        accept = "<C-l>",    -- Accept current suggestion
        accept_word = "<M-l>", -- Accept current word suggestion
        accept_line = "<M-CR>", -- Accept current line suggestion
        next = "<M-]>",     -- Next suggestion
        prev = "<M-[>",     -- Previous suggestion
        dismiss = "<C-]>",  -- Dismiss suggestion
      },
    },
    filetypes = {
      -- Set to true to enable Copilot for specific filetypes
      markdown = true,
      gitcommit = true,
      -- Set to true for default behavior (i.e., enable for all other filetypes).
      -- Change to false if you want to only enable for explicitly listed types.
      ["."] = true,
    },
    -- Path to your Node.js executable. 'node' should work if it's in your PATH.
    copilot_node_command = 'node',
    server_opts = {
      extraHeaders = {
        ["User-Agent"] = "github-copilot-nvim/1.0.0", -- Required by Copilot server
      },
      copilot_model = "",
    },
    -- If you use nvim-cmp and want Copilot suggestions to integrate,
    -- ensure the cmp source is set up. LazyVim's extra would have done this.
    -- Here's a basic example:
    -- If you already have a cmp config, you'll want to integrate this there.
    -- Otherwise, ensure cmp is also defined as a plugin.
    -- See nvim-cmp documentation for full integration.
  },
}
