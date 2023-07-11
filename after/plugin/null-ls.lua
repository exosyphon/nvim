vim.keymap.set("n", "<leader>l", '<cmd>lua vim.lsp.buf.format()<CR>')

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.protoc_gen_lint,
        null_ls.builtins.diagnostics.standardrb,
    },
})
