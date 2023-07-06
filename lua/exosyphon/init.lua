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

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "Y", "y$")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("v", "//", 'y/<C-R>"<CR>')

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugins/init.lua<CR>");

vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>")
vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>")

vim.keymap.set("n", "<leader>dt", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>")
vim.keymap.set("n",  "<leader>dso", "<cmd>DapStepOver<CR>")
vim.keymap.set("n",  "<leader>dsi", "<cmd>DapStepInto<CR>")
vim.keymap.set("n",  "<leader>dsu", "<cmd>DapStepOut<CR>")
vim.keymap.set("n",  "<leader>dst", "<cmd>DapStepTerminate<CR>")
vim.keymap.set("n",  "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n",  "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n",  "<leader>E", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>")
vim.keymap.set("n",  "<leader>dr", "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>")
vim.keymap.set("n",  "<leader>ds", "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>")
vim.keymap.set("n",  "<leader>df", "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>")
vim.keymap.set("n",  "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>")
vim.keymap.set("n",  "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>")
vim.keymap.set("n",  "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>")

vim.keymap.set("n",  "<leader>U", "<cmd>GitGutterUndoHunk<CR>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n",  "<leader>Z", "<cmd>Zi<CR>")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

require('lazy').setup('plugins')

