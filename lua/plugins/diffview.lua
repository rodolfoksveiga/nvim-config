return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>d", "<cmd>DiffviewOpen<cr>", desc = "Source control" },
	},
	opts = function()
		local actions = require("diffview.actions")

		return {
			diff_binaries = false,
			enhanced_diff_hl = false,
			git_cmd = { "git" },
			use_icons = false,
			show_help_hints = false,
			watch_index = true,
			hooks = {
				diff_buf_read = function(bufnr)
					vim.opt_local.colorcolumn = ""
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
					vim.opt_local.signcolumn = "no"
				end,
			},
			icons = {
				folder_closed = "",
				folder_open = "",
			},
			signs = {
				fold_closed = "",
				fold_open = "",
				done = "󰸞",
			},
			view = {
				default = { layout = "diff2_horizontal" }, -- file change
				merge_tool = { layout = "diff3_horizontal", disable_diagnostics = true }, -- merge/rebase
				file_history = { layout = "diff2_horizontal" }, -- file history
			},
			file_panel = {
				listing_style = "list",
				win_config = {
					position = "left",
					width = 32,
					win_opts = { colorcolumn = nil },
				},
			},
			file_history_panel = {
				log_options = {
					git = {
						single_file = { diff_merges = "combined" },
						multi_file = { diff_merges = "first-parent" },
					},
				},
				win_config = {
					position = "bottom",
					height = 20,
					win_opts = { colorcolumn = nil },
				},
			},
			commit_log_panel = {
				win_config = {},
			},
			keymaps = {
				disable_defaults = true,
				view = {
					{ "n", "<tab>", actions.select_next_entry },
					{ "n", "<s-tab>", actions.select_prev_entry },
					{ "n", "gf", actions.goto_file_tab },
					{ "n", "gt", actions.toggle_files },
					{ "n", "gcn", actions.prev_conflict },
					{ "n", "gcp", actions.next_conflict },
					{ "n", "g<", actions.conflict_choose("ours") },
					{ "n", "g>", actions.conflict_choose("theirs") },
					{ "n", "g=", actions.conflict_choose("all") },
					{ "n", "g-", actions.conflict_choose("none") },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				diff1 = {
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				diff2 = {
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				diff3 = {
					{ { "n", "x" }, "2do", actions.diffget("ours") },
					{ { "n", "x" }, "3do", actions.diffget("theirs") },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				diff4 = {
					{ { "n", "x" }, "1do", actions.diffget("base") },
					{ { "n", "x" }, "2do", actions.diffget("ours") },
					{ { "n", "x" }, "3do", actions.diffget("theirs") },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				file_panel = {
					{ "n", "<cr>", actions.select_entry },
					{ "n", "<2-leftmouse>", actions.select_entry },
					{ "n", "<tab>", actions.select_next_entry },
					{ "n", "<s-tab>", actions.select_prev_entry },
					{ "n", "k", actions.prev_entry },
					{ "n", "j", actions.next_entry },
					{ "n", "s", actions.toggle_stage_entry },
					{ "n", "S", actions.stage_all },
					{ "n", "U", actions.unstage_all },
					{ "n", "L", actions.open_commit_log },
					{
						"n",
						"R",
						actions.refresh_files,
						{ desc = "Update stats and entries in the file list." },
					},
					{ "n", "<c-u>", actions.scroll_view(-0.25) },
					{ "n", "<c-d>", actions.scroll_view(0.25) },
					{ "n", "gf", actions.goto_file_tab },
					{ "n", "gt", actions.toggle_files },
					{ "n", "gcn", actions.prev_conflict },
					{ "n", "gcp", actions.next_conflict },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
					{ "n", "<c-q>", "<cmd>DiffviewClose<cr>" },
				},
				file_history_panel = {
					{ "n", "<cr>", actions.select_entry },
					{ "n", "<2-LeftMouse>", actions.select_entry },
					{ "n", "k", actions.prev_entry },
					{ "n", "j", actions.next_entry },
					{ "n", "o", actions.open_in_diffview },
					{ "n", "<tab>", actions.select_next_entry },
					{ "n", "<s-tab>", actions.select_prev_entry },
					{ "n", "y", actions.copy_hash },
					{ "n", "L", actions.open_commit_log },
					{ "n", "<c-u>", actions.scroll_view(-0.25) },
					{ "n", "<c-d>", actions.scroll_view(0.25) },
					{ "n", "gf", actions.goto_file_tab },
					{ "n", "gt", actions.toggle_files },
					{ "n", "g!", actions.options },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
				},
				option_panel = {
					{ "n", "<tab>", actions.select_entry },
					{ "n", "q", actions.close },
					{ "n", "<esc>", actions.close },
					{ "n", "<c-q>", actions.close },
					{ "n", "<c-c>", actions.close },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
				},
				help_panel = {
					{ "n", "<c-q>", actions.close },
					{ "n", "<c-c>", actions.close },
					{ "n", "<leader>d", "<cmd>DiffviewClose<cr>" },
				},
			},
		}
	end,
}
