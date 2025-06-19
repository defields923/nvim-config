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
            local java_test_api = java.test

            map("n", "<leader>tjc", "<cmd>JavaTestRunCurrentClass<CR>", {
              desc = "Run current class",
            })
            map("n", "<leader>tjm", "<cmd>JavaTestRunCurrentMethod<CR>", {
              desc = "Run current method",
            })
            map("n", "<leader>tjr", "<cmd>JavaTestViewLastReport<CR>", {
              desc = "Show recent report",
            })
            -- map("n", "<leader>tjsc", function()
            --     java_test_api.run_current_class(function()
            --         java_test_api.view_last_report()
            --     end)
            -- end, {
            --     desc = "Test (Java): Run class & show report",
            -- })
            -- map("n", "<leader>tjsm", function()
            --     java_test_api.run_current_method(function ()
            --         print("hello")
            --         java_test_api.view_last_report()
            --     end)
            -- end, {
            --     desc = "Test (Java): Run method & show report",
            -- })

          end,
        },
      },
    },
  },
  -- dir = '~/open-source/nvim-java',
  -- dev = true,
}
