-- Open Ex as buffer
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "Open Ex" })

-- Exit insert mode without hitting Esc
vim.keymap.set("i", "jj", "<Esc>", { desc = "Esc" })

-- Make Y behave like C or D
vim.keymap.set("n", "Y", "y$")

-- Keep window centered when going up/down
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without overwriting register
vim.keymap.set("v", "p", '"_dP')

-- Copy text to " register
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank into \" register" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })

-- Delete text to " register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete into \" register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete into \" register" })

-- Get out Q
vim.keymap.set("n", "Q", "<nop>")

-- close buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Close buffer without closing split
vim.keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
vim.keymap.set("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor" })

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })

-- Jump to plugin management file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/exosyphon/lazy.lua<CR>", { desc = "Jump to lazy.lua" })

-- Run Tests
vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
    { desc = "Run Test File" })
vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
    { desc = "Run Current Test Directory" })
vim.keymap.set("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>",
    { desc = "Toggle Test Output Panel" })
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

-- Debug Tests
vim.keymap.set("n", "<leader>dt", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Start Debugging" })
vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>dsu", "<cmd>DapStepOut<CR>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dst", "<cmd>DapStepTerminate<CR>", { desc = "Stop Debugger" })
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Toggle Breakpoint Condition" })
vim.keymap.set("n", "<leader>E", "<cmd>lua require'dap'.set_exception_breakpoints()<CR>",
    { desc = "Toggle Exception Breakpoint" })
vim.keymap.set("n", "<leader>dr",
    "<cmd>lua require'dapui'.float_element('repl', { width = 100, height = 40, enter = true })<CR>",
    { desc = "Show DAP REPL" })
vim.keymap.set("n", "<leader>ds",
    "<cmd>lua require'dapui'.float_element('scopes', { width = 150, height = 50, enter = true })<CR>",
    { desc = "Show DAP Scopes" })
vim.keymap.set("n", "<leader>df",
    "<cmd>lua require'dapui'.float_element('stacks', { width = 150, height = 50, enter = true })<CR>",
    { desc = "Show DAP Stacks" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dapui'.float_element('breakpoints', { enter = true })<CR>",
    { desc = "Show DAP breakpoints" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debug Last Test" })

-- Copy file paths
vim.keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source current file" })

-- Open Zoxide telescope extension
vim.keymap.set("n", "<leader>Z", "<cmd>Zi<CR>", { desc = "Open Zoxide" })

-- Resize with arrows
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Block Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Block Up" })

-- Search for highlighted text in buffer
vim.keymap.set("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Exit terminal mode shortcut
vim.keymap.set("t", "<C-t>", "<C-\\><C-n>")
