-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "ellisonleao/gruvbox.nvim" }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                          -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },            -- Required
            { 'hrsh7th/cmp-nvim-lsp' },        -- Required
            { 'L3MON4D3/LuaSnip' },            -- Required
        }
    }

    use("nathom/tmux.nvim")
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-rspec",
            "haydenmeade/neotest-jest",
            "zidhuss/neotest-minitest",
            "nvim-neotest/neotest-vim-test",
        },
    }
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } }
    use {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    }
    use 'suketa/nvim-dap-ruby'
    use 'Pocco81/DAPInstall.nvim'
    use 'rcarriga/cmp-dap'
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use 'nanotee/zoxide.vim'
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use "debugloop/telescope-undo.nvim"
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'nvim-telescope/telescope.nvim' },
        },
    }
    use 'theHamsta/nvim-dap-virtual-text'
    use 'andymass/vim-matchup'
    use 'jinh0/eyeliner.nvim'
    use { "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    }
    use 'voldikss/vim-floaterm'
    use {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup {
                -- add any options here or leave empty
            }
        end
    }
    use 'airblade/vim-gitgutter'
    use 'mg979/vim-visual-multi'
    use 'tpope/vim-rails'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use 'aaronhallaert/advanced-git-search.nvim'
    use 'tpope/vim-rhubarb'
end)
