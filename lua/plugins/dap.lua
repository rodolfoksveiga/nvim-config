return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				automatic_setup = true,
				ensure_installed = {
					"delve",
				},
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			},
		},
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = { commented = true },
			config = true,
		},
	},
	keys = {
		{
			"<leader>vb",
			"<cmd>DapToggleBreakpoint<cr>",
			desc = "Breakpoint",
		},
		{
			"<leader>vc",
			"<cmd>DapContinue<cr>",
			desc = "Continue",
		},
		{
			"<leader>vi",
			"<cmd>DapStepInto<cr>",
			desc = "Step into",
		},
		{
			"<leader>vo",
			"<cmd>DapStepOut<cr>",
			desc = "Step out",
		},
		{
			"<leader>vO",
			"<cmd>DapStepOver<cr>",
			desc = "Step over",
		},
	},
}
