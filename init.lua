-- source files
require("core.settings")
require("core.keymaps")
require("core.root")

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- leader key
vim.g.mapleader = " "

-- load plugins
require("lazy").setup("plugins", {
	install = {
		missing = true,
		colorscheme = { "onedark" },
	},
	ui = {
		border = "rounded",
	},
})

require("core.highlights")

-- keymaps
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<cr>", { noremap = true, silent = true, desc = "Lazy" })
