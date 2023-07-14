return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		sign_priority = 100,
		on_attach = function(bufnr)
			local bufferSilentNoRemap = require("core.keymaps").bufferSilentNoRemap
			local gitsigns = package.loaded.gitsigns

			bufferSilentNoRemap("n", "ghn", function()
				if vim.wo.diff then
					return "ghn"
				end

				vim.schedule(function()
					gitsigns.next_hunk()
				end)

				return "<ignore>"
			end, bufnr)

			bufferSilentNoRemap("n", "ghp", function()
				if vim.wo.diff then
					return "ghp"
				end

				vim.schedule(function()
					gitsigns.prev_hunk()
				end)

				return "<ignore>"
			end, bufnr)

			bufferSilentNoRemap("n", "gho", gitsigns.preview_hunk, bufnr)
			bufferSilentNoRemap("n", "ghs", gitsigns.stage_hunk, bufnr)
			bufferSilentNoRemap("n", "ghu", gitsigns.undo_stage_hunk, bufnr)
			bufferSilentNoRemap("n", "ghr", gitsigns.reset_hunk, bufnr)
		end,
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "┃" },
			topdelete = { text = "┃" },
			changedelete = { text = "┃" },
			untracked = { text = "┃" },
		},
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = " <author>, <author_time:%d.%m.%Y> - <summary>",
		update_debounce = 100,
		max_file_length = 20000,
		preview_config = {
			border = "none",
			style = "minimal",
			relative = "cursor",
			row = -1,
			col = 1,
		},
	},
}
