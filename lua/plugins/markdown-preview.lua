return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	ft = { "markdown" },
	keys = {
		{ "<leader>k", "<cmd>MarkdownPreview<cr>", desc = "Markdown preview" },
	},
	config = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 0
		vim.g.mkdp_refresh_slow = 0
		vim.g.mkdp_browser = "qutebrowser"
	end,
}
