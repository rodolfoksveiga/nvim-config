return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = function()
		local keymaps = {
			{ "<c-n>", "<cmd>BufferLineCycleNext<cr>" },
			{ "<c-p>", "<cmd>BufferLineCyclePrev<cr>" },
			{ "<a-n>", "<cmd>BufferLineMoveNext<cr>" },
			{ "<a-p>", "<cmd>BufferLineMovePrev<cr>" },
		}
		for _, key in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) do
			table.insert(keymaps, {
				"<a-" .. key .. ">",
				function()
					require("bufferline").go_to_buffer(key, true)
				end,
			})
		end

		return keymaps
	end,
	opts = {
		highlights = {
			buffer_selected = {
				fg = "#cdd6f4", -- onedark: #abb2bf
				bold = true,
				italic = false,
			},
			buffer_visible = {
				fg = "#cdd6f4", -- onedark: #abb2bf
				bold = false,
				italic = false,
			},
			numbers_selected = {
				fg = "#cdd6f4", -- onedark: #abb2bf
				bold = true,
				italic = false,
			},
			numbers = {
				fg = "#cdd6f4", -- onedark: #abb2bf
			},
			numbers_visible = {
				fg = "#cdd6f4", -- onedark: #abb2bf
				bold = false,
				italic = false,
			},
			separator_selected = {
				fg = "#8aadf4", -- onedark: #61afef
			},
			separator = {
				fg = "#585b70", -- onedark: #61afef
			},
			separator_visible = {
				fg = "#585b70", -- onedark: #61afef
			},
			indicator_selected = {
				fg = "#8aadf4", -- onedark: #61afef
			},
		},
		options = {
			mode = "buffers",
			numbers = "ordinal",
			close_command = "",
			right_mouse_command = "bdelete %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = nil,
			indicator = { icon = "▎", style = "icon" },
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 30,
			max_prefix_length = 20,
			truncate_names = true,
			tab_size = 5,
			diagnostics = true,
			diagnostics_update_in_insert = false,
			color_icons = false,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			show_tab_indicators = true,
			show_duplicate_prefix = true,
			persist_buffer_sort = true,
			separator_style = "thin",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			offsets = {
				{
					filetype = "drex",
					text = "File Explorer",
					text_align = "center",
					highlight = "Statement",
					separator = false,
				},
				{
					filetype = "DiffviewFiles",
					text = "Source Control",
					text_align = "center",
					separator = false,
					highlight = "Statement",
				},
				{
					filetype = "fugitiveblame",
					text = "Git Blame",
					text_align = "center",
					separator = false,
					highlight = "Statement",
				},
				{
					filetype = "undotree",
					text = "Changes Tree",
					text_align = "center",
					separator = false,
					highlight = "Statement",
				},
				{
					filetype = "spectre_panel",
					text = "Refactoring Tool",
					text_align = "center",
					separator = false,
					highlight = "Statement",
				},
				{
					filetype = "dapui_breakpoints",
					text = "Debugger Tool",
					text_align = "center",
					separator = false,
					highlight = "Statement",
				},
			},
			custom_filter = function(bufnr)
				return vim.bo[bufnr].filetype ~= "drex"
					and vim.bo[bufnr].filetype ~= "DiffviewFiles"
					and vim.bo[bufnr].filetype ~= "fugitive"
					and vim.bo[bufnr].filetype ~= "fugitiveblame"
					and vim.bo[bufnr].filetype ~= "undotree"
					and vim.bo[bufnr].filetype ~= "spectre_panel"
			end,
		},
	},
}
