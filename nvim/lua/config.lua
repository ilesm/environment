

require('mike')

vim.api.nvim_set_keymap("n", "<Space>", "V:luado return mikemike(line)<Enter>", { noremap = true })


