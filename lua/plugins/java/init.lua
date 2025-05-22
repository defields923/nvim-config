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
            require("java").setup({
              -- Your custom nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
