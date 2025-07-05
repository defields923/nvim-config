return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            settings = {
              java = {
                configuration = {
                  runtimes = {
                    {
                      name = "JavaSE-21",
                      path = "/Library/Java/JavaVirtualMachines/jdk-21.jdk",
                      default = true,
                    },
                    {
                      name = "JavaSE-17",
                      path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk",
                      default = false,
                    },
                  },
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            local java = require("java")
            java.setup({
              -- Your custom nvim-java configuration goes here
            })

            local map = vim.keymap.set

            map("n", "<leader>tjc", "<cmd>JavaTestRunCurrentClass<CR>", {
              desc = "Run current class",
            })
            map("n", "<leader>tjm", "<cmd>JavaTestRunCurrentMethod<CR>", {
              desc = "Run current method",
            })
            map("n", "<leader>tjr", "<cmd>JavaTestViewLastReport<CR>", {
              desc = "Show recent report",
            })
          end,
        },
      },
    },
  },
  -- dir = '~/open-source/nvim-java',
  -- dev = true,
}
