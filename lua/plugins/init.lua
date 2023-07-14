-- no config plugins
return {
	--- async tasks
	{ "nvim-lua/plenary.nvim", lazy = true },
	--- user interface
	{ "MunifTanjim/nui.nvim", lazy = true },
	--- pairs handler
	{ "kylechui/nvim-surround", config = true },
	{
		"windwp/nvim-autopairs",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "RRethy/nvim-treesitter-endwise" },
	--- helm syntax highlighting
	{ "towolf/vim-helm" },
}
