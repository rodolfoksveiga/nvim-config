local O = {}

function O.getTextSubOptions(title, width)
	return {
		border = {
			style = "rounded",
			text = { top = " " .. title .. " ", top_align = "left" },
		},
		win_options = { winhighlight = "FloatTitle:Normal" },
		position = { row = 2, col = 0 },
		relative = { type = "cursor" },
		size = { width = width, height = 1 },
	}
end

function O.getActionsOptions()
	return {
		border = {
			style = "rounded",
			text = { top = " LSP Code Actions ", top_align = "center" },
			padding = { 0, 1 },
		},
		position = "50%",
		win_options = { winhighlight = "FloatTitle:Normal" },
	}
end

return O
