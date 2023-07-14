-- plugins to analyse: jump or hop
return {
	{
		"echasnovski/mini.jump",
		version = false,
		opts = {
			mappings = {
				forward = "f",
				backward = "F",
				forward_till = "t",
				backward_till = "T",
				repeat_jump = ";",
			},
		},
		config = function(_, opts)
			require("mini.jump").setup(opts)
		end,
	},
	--[[ {
		"echasnovski/mini.bufremove",
		version = false,
		keys = {
			{
				"<c-q>",
				function()
					local win_id = vim.fn.win_getid()
					if vim.api.nvim_win_get_config(win_id).zindex then
						vim.cmd("q")
					else
						require("mini.bufremove").wipeout()
					end
				end,
			},
		},
		config = function()
			require("mini.bufremove").setup()
		end,
	}, ]]
	{
		"echasnovski/mini.move",
		version = false,
		opts = {
			mappings = {
				left = "<a-h>",
				right = "<a-l>",
				down = "<a-j>",
				up = "<a-k>",
				line_left = "<a-h>",
				line_right = "<a-l>",
				line_down = "<a-j>",
				line_up = "<a-k>",
			},
			options = {
				reindent_linewise = true,
			},
		},
		config = function(_, opts)
			require("mini.move").setup(opts)
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		version = false,
		opts = {
			mappings = {
				toggle = "gj",
			},
		},
		config = function(_, opts)
			require("mini.splitjoin").setup(opts)
		end,
	},
}
