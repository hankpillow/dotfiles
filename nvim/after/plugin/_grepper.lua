vim.cmd([[
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
]])

vim.keymap.set("n", "<C-g>", ":Grepper -highlight -tool rg", { desc = "Grep files using rg" })
vim.keymap.set("n", "<A-g>", ":Grepper -side -tool rg", { desc = "Grep files using rg and open side window to check more item" })
