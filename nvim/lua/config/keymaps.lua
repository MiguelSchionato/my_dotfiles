-- my keymaps
-- source
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- movement on insert mode with ctrl
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")


-- move lines with ctrl
vim.keymap.set({"n","v",}, "<C-k>", "ddkP")
vim.keymap.set({"n","v",}, "<C-j>", "ddp")


-- Saves and quits
vim.keymap.set({"n","v","i"}, "<C-S>", "<esc>:w!<CR>",{noremap=true,silent=true})
vim.keymap.set({"n","v","i"}, "<C-Q>", "<esc>:q!<CR>",{noremap=true,silent=true})

-- neotree
vim.keymap.set({"n","v"}, "<leader>e", ":Neotree toggle<CR>",{noremap=true,silent=true})

-- terminal
vim.keymap.set("t", "<esc>", "<C-\\><C-n>",{noremap=true,silent=true})

-- clipboard
vim.keymap.set({"v","n","i","t"}, "<C-a>", "<esc>gg<S-v>G",{noremap=true,silent=true})


-- api
vim.keymap.set("n", "<leader>ct", function()
  require("custom.cmp_api").toggle_autocomplete()
end, { desc = "Ligar/Desligar Autocomplete do Cmp" })


