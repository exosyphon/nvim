local neotest = require('neotest')

local neotest_jest = require('neotest-jest')({
  jestCommand = 'npm test --'
})
neotest_jest.filter_dir = function (name)
  return name ~= 'node_modules' and name ~= '__snapshots__'
end

neotest.setup({
    adapters = {
        require('neotest-rspec')({
            rspec_cmd = function()
                return vim.tbl_flatten({
                    "bundle",
                    "exec",
                    "rspec",
                })
            end
        }),
        require('neotest-minitest'),
        neotest_jest,
    },
    output_panel = {
        enabled = true,
        open = "botright split | resize 15"
    },
    quickfix = {
      open = false,
    }
})

