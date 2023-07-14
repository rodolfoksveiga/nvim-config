return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			"stylua",
			"prettier",
			"shfmt",
			"gofumpt",
			"black",
		},
		auto_update = true,
		run_on_start = true,
	},
}
