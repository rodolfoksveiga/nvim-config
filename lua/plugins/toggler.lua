return {
	"nguyenvukhang/nvim-toggler",
	keys = {
		{
			"rt",
			function()
				require("nvim-toggler").toggle()
			end,
		},
	},
	opts = {
		inverses = {
			["bottom"] = "top",
		},
		remove_default_keybinds = true,
	},
}
