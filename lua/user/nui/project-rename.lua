local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local O = require("user.nui.popup-options")

local function project_rename()
	local currentName = vim.fn.expand("<cword>")

	local params = vim.lsp.util.make_position_params()

	local function onSubmit(newName)
		if not newName or #newName == 0 or currentName == newName then
			return
		end

		params.newName = newName

		vim.lsp.buf_request(0, "textDocument/rename", params, function(_, result, ctx, _)
			if not result then
				return
			end

			local client = vim.lsp.get_client_by_id(ctx.client_id)
			vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
		end)
	end

	local inputLength = string.len(currentName)
	inputLength = inputLength > 26 and inputLength + 2 or 26

	local input = Input(O.getTextSubOptions("LSP Rename", inputLength), { on_submit = onSubmit, prompt = "❯ " })

	input:mount()

	for _, mode in ipairs({ "n", "i" }) do
		input:map(mode, "<c-c>", input.input_props.on_close, { noremap = true })
	end

	input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return project_rename
