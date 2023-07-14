return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = function()
		local commandPrefix = '<cmd>lua require("fzf-lua").'
		local windowOptionsPostfix =
			'({winopts={fullscreen=true,preview={hidden="hidden",layout="vertical",vertical="down:95%"}}})<cr>'
		local buffersOptionsPostfix =
			'({winopts={height=0.3,width=0.5,preview={hidden="hidden",layout="vertical"}}})<cr>'
		local helpTagsOptionsPostfix = "({winopts={width=0.65}})<cr>"

		return {
			{ "<leader>fb", commandPrefix .. "buffers" .. buffersOptionsPostfix, desc = "Buffer" },
			{ "<leader>ff", commandPrefix .. "files()<cr>", desc = "File" },
			{ "<leader>fg", commandPrefix .. "git_files()<cr>", desc = "Git file" },
			{ "<leader>fl", commandPrefix .. "lines()<cr>", desc = "Line" },
			{ "<leader>fw", commandPrefix .. "grep_cword()<cr>", desc = "Word" },
			{ "<leader>fW", commandPrefix .. "grep_cWORD()<cr>", desc = "WORD" },
			{ "<leader>fv", commandPrefix .. "grep_visual()<cr>", desc = "Visual" },
			{ "<leader>fr", commandPrefix .. "live_grep()<cr>", desc = "Grep" },
			{ "<leader>fp", commandPrefix .. "lsp_workspace_diagnostics()<cr>", desc = "Grep" },
			{ "<leader>fR", commandPrefix .. "live_grep_resume()<cr>", desc = "Resume" },
			{ "<leader>fs", commandPrefix .. "git_status" .. windowOptionsPostfix, desc = "Git status" },
			{ "<leader>ft", commandPrefix .. "git_stash" .. windowOptionsPostfix, desc = "Git stash" },
			{ "<leader>fc", commandPrefix .. "git_commits" .. windowOptionsPostfix, desc = "Git commit" },
			{ "<leader>fh", commandPrefix .. "help_tags" .. helpTagsOptionsPostfix, desc = "Help tag" },
		}
	end,
	opts = function()
		local actions = require("fzf-lua.actions")

		return {
			winopts = {
				height = 0.90,
				width = 0.90,
				row = 0.35,
				col = 0.50,
				fullscreen = false,
				preview = {
					border = "border",
					wrap = "wrap",
					hidden = "nohidden",
					vertical = "down:70%",
					horizontal = "right:70%",
					layout = "flex",
					flip_columns = 120, -- numbers of cols to switch to horizontal on flex
					title = true,
					title_align = "center",
					scrollbar = "border",
					scrolloff = "-1", -- scrollbar overlays preview border
					scrollchars = { "█", "" },
					delay = 100, -- delay in ms displaying the preview (prevent lag and fast scrolling)
					winopts = {
						number = true,
						relativenumber = false,
						cursorline = true,
						cursorlineopt = "number", -- highlight the line and number
						cursorcolumn = false,
						signcolumn = "no",
						list = false,
						foldenable = false,
						foldmethod = "manual",
					},
				},
			},
			keymap = {
				builtin = {
					["<a-h>"] = "toggle-help",
					["<a-f>"] = "toggle-fullscreen",
					["<a-p>"] = "toggle-preview",
					["<c-u>"] = "preview-page-up",
					["<c-d>"] = "preview-page-down",
				},
				fzf = {
					["ctrl-b"] = "half-page-up",
					["ctrl-f"] = "half-page-down",
					["ctrl-c"] = "abort",
					["ctrl-w"] = "unix-line-discard",
					["ctrl-a"] = "beginning-of-line",
					["ctrl-e"] = "end-of-line",
					["ctrl-u"] = "preview-page-up",
					["ctrl-d"] = "preview-page-down",
					["alt-p"] = "toggle-preview",
					["alt-a"] = "toggle-all",
				},
			},
			actions = {
				files = {
					["default"] = actions.file_edit,
					["ctrl-x"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
				},
				git = {
					["default"] = actions.file_edit,
					["ctrl-x"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
				},
				buffers = {
					["default"] = actions.buf_edit,
				},
			},
			fzf_opts = {
				["--ansi"] = "",
				["--info"] = "inline",
				["--height"] = "100%",
				["--layout"] = "reverse",
				["--border"] = "none",
			},
			fzf_colors = {
				-- ["fg"] = { "fg", "CursorLine" },
				-- ["bg"] = { "bg", "Normal" },
				-- ["hl"] = { "fg", "Comment" },
				["fg+"] = { "fg", "Normal" },
				["bg+"] = { "bg", "Normal" },
				["hl+"] = { "fg", "Statement" },
				["info"] = { "fg", "Statement" },
				["pointer"] = { "fg", "Exception" },
				["marker"] = { "fg", "Exception" },
				-- ["prompt"] = { "fg", "Conditional" },
				-- ["spinner"] = { "fg", "Label" },
				-- ["header"] = { "fg", "Comment" },
				-- ["gutter"] = { "bg", "Normal" },
			},
			previewers = {
				cat = {
					cmd = "cat",
					args = "--number",
				},
				bat = {
					cmd = "bat",
					args = "",
					theme = "",
					config = "$HOME/.config/bat/config",
				},
				head = {
					cmd = "head",
					args = nil,
				},
				git_diff = {
					cmd_deleted = "git diff --color HEAD --",
					cmd_modified = "git diff --color HEAD",
					cmd_untracked = "git diff --color --no-index /dev/null",
					pager = "delta --width=$FZF_PREVIEW_COLUMNS",
				},
				man = {
					cmd = "man -c %s | col -bx",
				},
				builtin = {
					syntax = true,
					extensions = {
						["png"] = { "ueberzug" },
						["jpg"] = { "ueberzug" },
					},
					ueberzug_scaler = "cover",
				},
			},
			files = {
				prompt = "Files❯ ",
				multiprocess = true,
				git_icons = false,
				file_icons = true,
				color_icons = false,
				-- path_shorten = 1,
				find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
				rg_opts = "--color=never --files --hidden --follow -g '!.git'",
				fd_opts = "--color=never --type f --hidden --follow --exclude .git",
			},
			git = {
				files = {
					prompt = "GitFiles❯ ",
					cmd = "git ls-files --exclude-standard",
					multiprocess = true,
					git_icons = false,
					file_icons = true,
					color_icons = false,
					-- path_shorten = 1,
				},
				status = {
					prompt = "GitStatus❯ ",
					no_header = true,
					cmd = "git status -s",
					file_icons = false,
					git_icons = true,
					color_icons = false,
					previewer = "git_diff",
					-- path_shorten = 1,
					actions = {
						["alt-u"] = { actions.git_unstage, actions.resume },
						["alt-s"] = { actions.git_stage, actions.resume },
					},
				},
				commits = {
					prompt = "Commits❯ ",
					cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset'",
					preview = "git show --pretty='%Cred%H%n%Cblue%an <%ae>%n%C(yellow)%cD%n%Cgreen%s' --color {1}",
					preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
					actions = {
						["default"] = actions.git_checkout,
					},
				},
				branches = {
					prompt = "Branches❯ ",
					cmd = "git branch --all --color",
					preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
					actions = {
						["default"] = actions.git_switch,
					},
				},
				stash = {
					prompt = "Stash❯ ",
					no_header = true,
					no_header_i = true,
					cmd = "git stash list",
					preview = "git stash show --patch --color {1}",
					preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
					actions = {
						["default"] = actions.git_stash_apply,
						["alt-x"] = { actions.git_stash_drop, actions.resume },
					},
					fzf_opts = {
						["--no-multi"] = "",
						["--delimiter"] = "'[:]'",
					},
				},
				icons = {
					["M"] = { icon = "M", color = "yellow" },
					["D"] = { icon = "D", color = "red" },
					["A"] = { icon = "A", color = "green" },
					["R"] = { icon = "R", color = "yellow" },
					["C"] = { icon = "C", color = "yellow" },
					["T"] = { icon = "T", color = "magenta" },
					["?"] = { icon = "?", color = "magenta" },
				},
			},
			grep = {
				prompt = "Rg❯ ",
				no_header = true,
				no_header_i = false,
				input_prompt = "Grep for: ",
				multiprocess = true,
				git_icons = false,
				file_icons = true,
				color_icons = false,
				grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
				rg_glob = false,
				glob_flag = "--iglob", -- case insensitive
				glob_separator = "%s%-%-", -- lua query separator
				actions = {
					["alt-g"] = { actions.grep_lgrep },
				},
			},
			buffers = {
				prompt = "Buffers❯ ",
				file_icons = true,
				color_icons = false,
				sort_lastused = false,
				actions = {
					["ctrl-x"] = { actions.buf_del, actions.resume },
				},
			},
			lines = {
				prompt = "Lines❯ ",
				show_unlisted = false,
				no_term_buffers = true,
				fzf_opts = {
					["--delimiter"] = "'[\\]:]'",
					["--nth"] = "2..",
					["--tiebreak"] = "index",
				},
			},
			diagnostics = {
				prompt = "Diagnostics❯ ",
				cwd_only = false,
				file_icons = false,
				git_icons = false,
				diag_icons = true,
				icon_padding = "",
			},
			file_icon_padding = "",
		}
	end,
}
