return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	opts = {
		ui = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("MasonNoCursorLine", {}),
			pattern = "mason",
			command = "setlocal nocursorline",
		})

		require("mason").setup(opts)
	end,
}
