return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
		{
			"<leader>eg",
			"<cmd>TermExec cmd='go run ~/Git/k8s-gin/api/main.go'<cr>",
			desc = "Go Test",
		},
	},
	opts = {
		hide_numbers = true,
		autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
		shade_terminals = false,
		start_in_insert = true,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		close_on_exit = true, -- close the terminal window when the process exits
		shell = vim.o.shell, -- change the default shell
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		direction = "float",
		float_opts = {
			border = "curved",
			width = 150,
			height = 30,
			winblend = 0,
		},
		winbar = { enabled = false },
		on_open = function()
			vim.cmd("noh")
		end,
	},
}
