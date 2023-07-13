local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
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
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'ellisonleao/gruvbox.nvim',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
    'tpope/vim-repeat',
    'nathom/tmux.nvim',
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-rspec",
            "haydenmeade/neotest-jest",
            "zidhuss/neotest-minitest",
            "mfussenegger/nvim-dap",
            "jfpedroza/neotest-elixir",
        },
        opts = {
            adapters = {
                ["neotest-elixir"] = {},
                ["neotest-minitest"] = {},
            },
        },
        config = function()
            local neotest = require('neotest')

            local neotest_jest = require('neotest-jest')({
                jestCommand = 'npm test --'
            })
            neotest_jest.filter_dir = function(name)
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
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                config = function(_, opts)
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup(opts)
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open({})
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close({})
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        dapui.close({})
                    end
                end,
            },
            {
                "suketa/nvim-dap-ruby",
                config = function()
                    require("dap-ruby").setup()
                end,
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "mason.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    automatic_installation = true,
                    handlers = {},
                    ensure_installed = {},
                },
            },
            { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        },
        -- stylua: ignore
        -- keys = {
        --     { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
        --                                                                                                               desc =
        --         "Breakpoint Condition" },
        --     { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc =
        --     "Toggle Breakpoint" },
        --     { "<leader>dc", function() require("dap").continue() end,                                             desc =
        --     "Continue" },
        --     { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc =
        --     "Run to Cursor" },
        --     { "<leader>dg", function() require("dap").goto_() end,                                                desc =
        --     "Go to line (no execute)" },
        --     { "<leader>di", function() require("dap").step_into() end,                                            desc =
        --     "Step Into" },
        --     { "<leader>dj", function() require("dap").down() end,                                                 desc =
        --     "Down" },
        --     { "<leader>dk", function() require("dap").up() end,                                                   desc =
        --     "Up" },
        --     { "<leader>dl", function() require("dap").run_last() end,                                             desc =
        --     "Run Last" },
        --     { "<leader>do", function() require("dap").step_out() end,                                             desc =
        --     "Step Out" },
        --     { "<leader>dO", function() require("dap").step_over() end,                                            desc =
        --     "Step Over" },
        --     { "<leader>dp", function() require("dap").pause() end,                                                desc =
        --     "Pause" },
        --     { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc =
        --     "Toggle REPL" },
        --     { "<leader>ds", function() require("dap").session() end,                                              desc =
        --     "Session" },
        --     { "<leader>dt", function() require("dap").terminate() end,                                            desc =
        --     "Terminate" },
        --     { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc =
        --     "Widgets" },
        -- },
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'gruvbox'
                }
            })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            })
        end
    },
    {
        'junegunn/fzf',
        build = ":call fzf#install()"
    },
    'nanotee/zoxide.vim',
    'nvim-telescope/telescope-ui-select.nvim',
    'debugloop/telescope-undo.nvim',
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
        },
    },
    'jinh0/eyeliner.nvim',
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },
    {
        'voldikss/vim-floaterm',
        config = function()
            vim.keymap.set("n", "<leader>ft",
                "<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>")
        end
    },
    {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup()
        end
    },
    'airblade/vim-gitgutter',
    'mg979/vim-visual-multi',
    'tpope/vim-rails',
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('null-ls').setup({

            })
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    },
    {
        'folke/which-key.nvim',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            'tpope/vim-rhubarb',
        },
    },
}

require('lazy').setup(plugins, {
    change_detection = {
        notify = false,
    }
})

