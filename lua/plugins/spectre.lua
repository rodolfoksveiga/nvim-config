return {
	"windwp/nvim-spectre",
	keys = {
		{
			"<leader>r",
			function()
				require("spectre").open()
			end,
			desc = "Refactoring tool",
		},
	},
	opts = {
		color_devicons = false,
		open_cmd = "75 vnew",
		live_update = true,
		line_sep_start = "",
		result_padding = "    ",
		line_sep = "",
		highlight = {
			ui = "String",
			search = "DiffChange",
			replace = "DiffDelete",
		},
		mapping = {
			["enter_file"] = {
				map = "<cr>",
				cmd = "<cmd>lua require('spectre.actions').select_entry()<cr>",
				desc = "Go to current file",
			},
			["toggle_line"] = {
				map = "gst",
				cmd = "<cmd>lua require('spectre').toggle_line()<cr>",
				desc = "Toggle current item",
			},
			["run_replace"] = {
				map = "gsa",
				cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
				desc = "Replace all",
			},
			["run_current_replace"] = {
				map = "gsl",
				cmd = "<cmd>lua require('spectre.actions').run_current_replace()<cr>",
				desc = "Replace current line",
			},
			["toggle_ignore_case"] = {
				map = "gsi",
				cmd = "<cmd>lua require('spectre').change_options('ignore-case')<cr>",
				desc = "Toggle ignore case",
			},
			["toggle_ignore_hidden"] = {
				map = "gsh",
				cmd = "<cmd>lua require('spectre').change_options('hidden')<cr>",
				desc = "Toggle search hidden",
			},
			["resume_last_search"] = {
				map = "gsR",
				cmd = "<cmd>lua require('spectre').resume_last_search()<cr>",
				desc = "Resume last search before close",
			},
			["show_option_menu"] = {
				map = "gso",
				cmd = "<cmd>lua require('spectre').show_options()<cr>",
				desc = "Show option",
			},
			["quit_spectre_1"] = {
				map = "<leader>r",
				cmd = '<cmd>lua require("spectre").close()<cr>',
				desc = "Close refactoring tool",
			},
			["quit_spectre_2"] = {
				map = "<c-q>",
				cmd = '<cmd>lua require("spectre").close()<cr>',
				desc = "Close refactoring tool",
			},
		},
		find_engine = {
			["rg"] = {
				cmd = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				options = {
					["ignore-case"] = {
						value = "--ignore-case",
						icon = "[Case insensitive]",
						desc = "ignore case",
					},
					["hidden"] = {
						value = "--hidden",
						icon = "[Replace hidden]",
						desc = "hidden file",
					},
				},
			},
		},
		replace_engine = {
			["sed"] = {
				cmd = "sed",
				args = nil,
				options = {},
			},
		},
		default = {
			find = {
				cmd = "rg",
				options = { "ignore-case" },
			},
			replace = {
				cmd = "sed",
			},
		},
		replace_vim_cmd = "cdo",
		is_open_target_win = false,
		is_insert_mode = false,
	},
}
