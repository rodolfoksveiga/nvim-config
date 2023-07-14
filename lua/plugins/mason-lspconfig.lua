return {
	"williamboman/mason-lspconfig.nvim",
	keys = {
		{ "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" },
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"tsserver",
			"eslint",
			"jsonls",
			"yamlls",
			"html",
			"terraformls",
			"pyright",
			"gopls",
			"marksman",
		},
		automatic_installation = true,
	},
}
