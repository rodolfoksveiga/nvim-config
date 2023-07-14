return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		char = "", -- │ ┊
		show_current_context = true,
		show_current_context_start = false,
		show_trailing_blankline_indent = false,
	},
}
