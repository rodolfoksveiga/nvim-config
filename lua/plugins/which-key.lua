return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		plugins = {
			marks = false,
			registers = false,
			spelling = { enabled = false },
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = true,
				g = false,
			},
		},
		operators = {},
		key_labels = { ["<space>"] = "SPC", ["<cr>"] = "ENT", ["<tab>"] = "TAB" },
		motions = { count = true },
		icons = { breadcrumb = "+", separator = "", group = "" },
		popup_mappings = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
		window = {
			border = "rounded",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 2, 1, 2 },
			winblend = 0,
		},
		layout = {
			height = { min = 3, max = 25 },
			width = { min = 10, max = 50 },
			spacing = 4,
			align = "center",
		},
		ignore_missing = false,
		hidden = { "<silent>", "<cmd>", "<cmd>", "<cr>", "^:", "^ ", "^call ", "^lua " },
		show_help = true,
		show_keys = true,
		triggers = { "<leader>" },
		triggers_nowait = {},
		-- triggers_blacklist = {
		-- 	n = { "" },
		-- },
		disable = {
			buftypes = {},
			filetypes = {},
		},
	},
	config = function(_, opts)
		vim.o.timeout = true
		vim.o.timeoutlen = 250

		local whichKey = require("which-key")

		whichKey.setup(opts)

		local keymaps = {
			mode = { "n", "v" },
			c = { name = "File manager" },
			e = { name = "Execute" },
			f = { name = "Fuzzy finder" },
			g = { name = "Git" },
			ga = { name = "Add" },
			gc = { name = "Commit" },
			gp = { name = "Push" },
			gr = { name = "Rebase" },
			gs = { name = "Switch" },
			gt = { name = "Stash" },
			l = { name = "LSP" },
			m = { name = "Package manager" },
			n = { name = "Neorg" },
			s = { name = "Session" },
			v = { name = "DAP" },
		}

		whichKey.register(keymaps, {
			mode = "n",
			prefix = "<leader>",
			silent = true,
			noremap = true,
			nowait = false,
		})
	end,
}
