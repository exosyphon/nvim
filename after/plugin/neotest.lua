require("neotest").setup({
  adapters = {
      require('neotest-rspec'),
      require('neotest-minitest'),
      require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(_path)
            return vim.fn.getcwd()
          end,
      })
  },
})
