vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- a cool remap, allows using shift j and k
-- to move hightlighted text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- make ctrl c cancel insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- stop going into recording mode pls
vim.keymap.set("n", "Q", "<nop>")
-- format file
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- something to do with code actions, not sure
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Remap ctrl hjkl to move in command and insert mode
vim.keymap.set({ 'c', 'i' }, '<C-h>', '<Left>')
vim.keymap.set({ 'c', 'i' }, '<C-j>', '<Down>')
vim.keymap.set({ 'c', 'i' }, '<C-k>', '<Up>')
vim.keymap.set({ 'c', 'i' }, '<C-l>', '<Right>')

-- Switch buffers
vim.keymap.set('n', '<leader>l', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>bd<CR>')

-- fold remap
vim.keymap.set('n', '<enter>', 'za')
vim.keymap.set('n', '<leader>/', '<cmd>nohlsearch<CR>');

vim.g.diagnostics_showing = true
vim.keymap.set({ 'c', 'i', 'v', 'n' }, '<F8>', function()
	-- Closest thing to a ternary in lua
	local signColumnValue = (vim.wo.signcolumn == 'yes' and 'no') or 'yes';
	if vim.g.diagnostics_showing then
		vim.g.diagnostics_showing = false
		vim.diagnostic.hide();
	else
		vim.g.diagnostics_showing = true
		vim.diagnostic.show()
	end
	return ':set invpaste invnumber invlist relativenumber! signcolumn=' .. signColumnValue .. '<CR>';
end, { expr = true })
