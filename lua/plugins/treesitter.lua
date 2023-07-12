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
                "heex",
                "eex",
                "java",
                "kotlin",
                "jq",
                "dockerfile",
                "json",
                "html",
                "terraform",
                "go",
                "tsx",
                "bash",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
