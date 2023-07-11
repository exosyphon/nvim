return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "javascript",
                "typescript",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "erlang",
                "java",
                "kotlin",
                "jq",
                "dockerfile",
                "json",
                "html",
                "terraform",
                "go",
                "tsx",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
