return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
			format = {
				cmdline = { pattern = "^:", icon = ":", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
				filter = { pattern = "^:%s!", icon = "$", lang = "bash" },
				lua = { pattern = "^:%slua%s+", icon = "", lang = "lua" },
				help = { pattern = "^:%she?l?p?%s+", icon = "" },
				input = {},
			},
		},
		messages = { enabled = false },
		popupmenu = { enabled = false, backend = "nui", kind_icons = false },
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		notify = { enabled = false },
		lsp = {
			progress = { enabled = false },
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,
			},
			hover = { enabled = false },
			signature = { enabled = false },
			message = { enabled = false },
		},
		health = { checker = false },
		smart_move = { enabled = false },
		throttle = 1000 / 30,
	},
}
