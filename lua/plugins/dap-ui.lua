return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	keys = {
		{
			"<leader>b",
			function()
				require("dapui").toggle()
			end,
			desc = "Debugger tool",
		},
	},
	opts = {
		floating = {
			border = "none",
			mappings = {
				close = { "q" },
			},
		},
		layouts = {
			{
				elements = {
					{
						id = "breakpoints",
						size = 0.2,
					},
					{
						id = "scopes",
						size = 0.5,
					},
					{
						id = "stacks",
						size = 0.2,
					},
					{
						id = "watches",
						size = 0.1,
					},
				},
				position = "left",
				size = 48,
			},
			{
				elements = {
					{
						id = "repl",
						size = 0.4,
					},
					{
						id = "console",
						size = 0.6,
					},
				},
				position = "bottom",
				size = 8,
			},
		},
		mappings = {
			remove = "d", -- breakpoints
			edit = "e", -- scopes
			expand = { "<cr>", "<1-leftmouse>" }, -- scopes
			open = "o", -- stacks
			repl = "r", -- scopes and watches
			toggle = "<cr>", -- stacks
		},
	},
}
