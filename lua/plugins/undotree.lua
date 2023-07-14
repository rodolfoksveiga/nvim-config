return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Changes tree" },
	},
	config = function()
		vim.g.undotree_WindowLayout = 1
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_DiffAutoOpen = 0
		vim.g.undotree_ShortIndicators = 1
		vim.g.undotree_RelativeTimestamp = 1
		vim.g.undotree_SplitWidth = 30
		vim.g.undotree_DiffpanelHeight = 10
	end,
}
