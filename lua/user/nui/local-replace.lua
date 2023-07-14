local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local getTextSubOptions = require("user.nui.popup-options").getTextSubOptions

local function getVisualSelection()
	local textStart = vim.fn.getpos("'<") -- [bufnum, lnum, col, off]
	local textEnd = vim.fn.getpos("'>") -- [bufnum, lnum, col, off]

	return {
		text = string.sub(vim.fn.getline(textStart[2]), textStart[3], textEnd[3]),
		position = { textStart[2], textStart[3] - 1 },
	}
end

local function local_replace()
	local lastMode = vim.fn.mode()
	local lastPosition = vim.api.nvim_win_get_cursor(0)
	local currentText = vim.fn.expand("<cword>")

	local function onSubmit(newText)
		if lastMode == "v" then
			local visualSelection = getVisualSelection()
			currentText = visualSelection.text
			lastPosition = visualSelection.position
		end

		vim.cmd("%s/" .. currentText .. "/" .. newText .. "/g")

		vim.api.nvim_win_set_cursor(0, lastPosition)

		vim.cmd("noh")
	end

	local inputLength = string.len(currentText)
	inputLength = inputLength > 26 and inputLength + 2 or 26

	local input = Input(getTextSubOptions("Local Replace", inputLength), { on_submit = onSubmit, prompt = "❯ " })

	input:mount()

	for _, mode in ipairs({ "n", "i" }) do
		input:map(mode, "<c-c>", input.input_props.on_close, { noremap = true })
	end

	input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return local_replace
