return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	opts = {
		ensure_installed = "all",
		auto_install = false,
		sync_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true, disable = { "python" } },
		autopairs = { enable = true },
		autotag = { enable = true },
		endwise = { enable = true },
		context_commentstring = { enable = true, enable_autocmd = false },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
