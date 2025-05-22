return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files
        hide_dotfiles = false,  -- Deprecated
        hide_gitignored = false, -- Show git ignored files
        hide_hidden = false, -- New option.
      },
    },
    -- other Neo-tree options...
  },
}
