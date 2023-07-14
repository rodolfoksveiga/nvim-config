return {
	"rodolfoksveiga/drex.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>p", '<cmd>lua require("user.drex").find_element("%")<cr>', desc = "File explorer" },
	},
	config = function()
		-- autocmd
		--- remove drex from buffers list
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("DrexNotListed", {}),
			pattern = "drex",
			command = "setlocal nobuflisted",
		})

		--- don't allow windows openning on drex drawer
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("DrexDrawerWindow", {}),
			pattern = "*",
			callback = function(args)
				if vim.api.nvim_get_current_win() == require("drex.drawer").get_drawer_window() then
					local is_drex_buffer = function(b)
						local ok, syntax = pcall(vim.api.nvim_buf_get_option, b, "syntax")
						return ok and syntax == "drex"
					end
					local prev_buf = vim.fn.bufnr("#")

					if is_drex_buffer(prev_buf) and not is_drex_buffer(args.buf) then
						vim.api.nvim_set_current_buf(prev_buf)
						vim.schedule(function()
							vim.cmd([['"]])
						end)
					end
				end
			end,
		})

		-- configuration
		require("drex.config").configure({
			icons = {
				file_default = "",
				link = "",
				dir_open = "",
				dir_closed = "",
				others = "",
			},
			colored_icons = false,
			hide_cursor = false,
			hijack_netrw = false,
			drawer = {
				default_width = 32,
			},
			disable_default_keybindings = true,
			keybindings = {
				["n"] = {
					["l"] = '<cmd>lua require("drex.elements").expand_element()<cr>j',
					["<cr>"] = '<cmd>lua require("user.drex").open()<cr>',
					["h"] = '<cmd>lua require("drex.elements").collapse_directory()<cr>',
					["<bs>"] = '<cmd>lua require("drex.elements").open_parent_directory()<cr>',
					["<c-v>"] = '<cmd>lua require("drex.elements").open_file("vs")<cr>',
					["<c-x>"] = '<cmd>lua require("drex.elements").open_file("sp")<cr>',
					["<tab>"] = "<cmd>DrexToggle<cr>",
					["<c-c>"] = '<cmd>lua require("drex.clipboard").clear_clipboard()<cr>',
					["c"] = '<cmd>lua require("user.drex").create()<cr>',
					["d"] = '<cmd>lua require("user.drex").flexible_action(require("drex.actions.files").delete, require("drex.actions.files").delete)<cr>',
					["r"] = '<cmd>lua require("user.drex").flexible_action(require("drex.actions.files").rename, require("drex.actions.files").multi_rename)<cr>',
					["p"] = '<cmd>lua require("user.drex").copy_and_paste(false)<cr>',
					["P"] = '<cmd>lua require("user.drex").copy_and_paste(true)<cr>',
					["y"] = '<cmd>lua require("drex.actions.text").copy_name()<cr>',
					["Y"] = '<cmd>lua require("drex.actions.text").copy_absolute_path()<cr>',
					["S"] = '<cmd>lua require("drex.actions.stats").stats()<cr>',
					["R"] = '<cmd>lua require("drex").reload_directory()<cr>',
					["<leader>p"] = "<cmd>bw<cr>",
				},
			},
			on_enter = function()
				vim.opt_local.colorcolumn = ""
				vim.opt_local.signcolumn = "no"
				vim.cmd("noh")

				require("drex.clipboard").clear_clipboard()
			end,
			on_leave = function()
				require("drex.clipboard").clear_clipboard()
			end,
		})
	end,
}
