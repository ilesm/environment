

require('mike')

vim.api.nvim_set_keymap("n", "<Space>", ":.luado return mikemike(line)<Enter>", { noremap = true })
vim.api.nvim_set_keymap("v", "<Space>", ":luado return mikemike(line)<Enter>", { noremap = true })


