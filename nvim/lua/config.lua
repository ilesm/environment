

vim.api.nvim_set_keymap("n", "<Space>", ":.luado return require('mike-utils').toggle_checkbox(line)<Enter>", { noremap = true })
vim.api.nvim_set_keymap("v", "<Space>", ":luado return require('mike-utils').toggle_checkbox(line)<Enter>", { noremap = true })


