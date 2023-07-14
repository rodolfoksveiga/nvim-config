return {
	"tpope/vim-fugitive",
	keys = function()
		local function get_branch_name()
			local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
			return branch
		end

		return {
			{ "<leader>gaa", "<cmd>Git add -A<cr>", desc = "All files" },
			{ "<leader>gaf", "<cmd>Gwrite<cr>", desc = "This file" },
			{ "<leader>gu", "<cmd>Git pull<cr>", desc = "Pull" },
			{ "<leader>gcc", ":Git commit -m ", desc = "Commit" },
			{ "<leader>gf", "<cmd>tab Git<cr>", desc = "Files" },
			{ "<leader>gca", "<cmd>tab Git commit --amend --no-edit<cr>", desc = "Ammend" },
			{ "<leader>gd", "<cmd>tab Git diff<cr>", desc = "Diff" },
			{ "<leader>gl", "<cmd>tab Git log --decorate=short<cr>", desc = "Logs" },
			{ "<leader>gw", "<cmd>tab Git show --decorate=short<cr>", desc = "Show" },
			{ "<leader>gm", ":Git merge " .. get_branch_name() .. " ", desc = "Merge" },
			{ "<leader>gpp", "<cmd>Git push<cr>", desc = "Push" },
			{ "<leader>gpf", "<cmd>Git push --force-with-lease<cr>", desc = "Force" },
			{
				"<leader>gpu",
				"<cmd>Git push -u origin " .. get_branch_name() .. "<cr>",
				desc = "Upstream",
			},
			{ "<leader>grs", ":Git rebase ", desc = "Start" },
			{ "<leader>grc", "<cmd>Git rebase --continue<cr>", desc = "Continue" },
			{ "<leader>gra", "<cmd>Git rebase --abort<cr>", desc = "Abort" },
			{ "<leader>gss", ":Git switch ", desc = "Switch" },
			{ "<leader>gsc", ":Git switch -c ", desc = "Create" },
			{ "<leader>gsm", "<cmd>Git switch master <cr>", desc = "Master" },
			{ "<leader>gtt", "<cmd>Git stash<cr>", desc = "Stash" },
			{ "<leader>gtp", "<cmd>Git stash pop<cr>", desc = "Pop" },
			{ "<leader>gx", "<cmd>Git reset .<cr>", desc = "Reset soft" },
		}
	end,
}
