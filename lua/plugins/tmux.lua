return {
  "nathom/tmux.nvim",
  config = function()
    local map = vim.api.nvim_set_keymap
    map("n", "<C-h>", [[<cmd>lua require('tmux').move_left()<cr>]], { desc = "Go left tmux window" })
    map("n", "<C-j>", [[<cmd>lua require('tmux').move_down()<cr>]], { desc = "Go top tmux window" })
    map("n", "<C-k>", [[<cmd>lua require('tmux').move_up()<cr>]], { desc = "Go bottom tmux window" })
    map("n", "<C-l>", [[<cmd>lua require('tmux').move_right()<cr>]], { desc = "Go right tmux window" })
  end,
}
