return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.defaults = opts.defaults or {}

    table.insert(opts.spec, { "<leader>t", group = "+tests", remap = false})

    return opts
  end,
}
