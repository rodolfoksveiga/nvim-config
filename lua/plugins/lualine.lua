return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	opts = {
		options = {
			theme = "catppuccin",
			disabled_filetypes = {
				"drex",
				"neo-tree",
				"DiffviewFiles",
				"fugitive",
				"fugitiveblame",
				"mind",
				"undotree",
				"spectre_panel",
			},
			icons_enabled = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			always_divide_middle = true,
			globalstatus = false,
			refresh = { statusline = 1000 },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					sections = { "error", "warn", "info", "hint" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
					colored = true,
					update_in_insert = false,
					always_visible = false,
				},
			},
			lualine_c = {
				{
					"filename",
					path = 2,
					colored = true,
					file_status = true,
					newfile_status = true,
					shorting_target = 60,
					symbols = {
						modified = "●",
						readonly = "[RO]",
						unnamed = "[No Name]",
						newfile = "",
					},
				},
			},
			lualine_x = {
				"encoding",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_c = { "filename" },
			lualine_x = { "location" },
		},
	},
}
