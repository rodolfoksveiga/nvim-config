return {
	"olimorris/persisted.nvim",
	event = "VimEnter",
	keys = {
		{ "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save" },
		{ "<leader>sl", "<cmd>SessionLoad<cr>", desc = "Load" },
	},
	config = true,
	opts = {
		save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
		silent = false,
		use_git_branch = true,
		branch_separator = "_",
		autosave = false,
		autoload = false,
	},
}
