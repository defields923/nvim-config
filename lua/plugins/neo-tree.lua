-- Your nvim-neo-tree config file
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
      -- Add Avante-specific commands
      commands = {
        avante_add_files = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local relative_path = require('avante.utils').relative_path(filepath)

          local sidebar = require('avante').get()

          local open = sidebar:is_open()
          -- Ensure avante sidebar is open
          if not open then
            require('avante.api').ask()
            sidebar = require('avante').get()
          end

          sidebar.file_selector:add_selected_file(relative_path)

          -- Remove neo-tree buffer from selected files if Avante sidebar was just opened
          if not open then
            sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
          end
        end,
      },
      filtered_items = {
        visible = true, -- Show hidden files
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
      -- Add Avante-specific keybindings
      window = {
        mappings = {
          ['oa'] = 'avante_add_files', -- Map 'oa' to add file/folder to Avante
        },
      },
    },
    -- other Neo-tree options...
  },
}
