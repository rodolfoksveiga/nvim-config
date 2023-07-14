local D = {}

local utils = require("drex.utils")
local elements = require("drex.elements")
local focus_element = elements.focus_element
local expand_element = elements.expand_element
local open_directory_buffer = require("drex").open_directory_buffer
local clipboard = require("drex.clipboard")
local close_drawer = require("drex.drawer").close
local get_clipboard_entries = clipboard.get_clipboard_entries
local clear_clipboard = clipboard.clear_clipboard
local files = require("drex.actions.files")
local create = files.create
local paste = files.paste

function D.find_element(path)
	path = utils.expand_path(path)
	open_directory_buffer(".")
	pcall(focus_element, vim.api.nvim_get_current_win(), path)
end

function D.flexible_action(single_action, multi_action)
	local action = multi_action
	local target = "clipboard"
	if vim.tbl_isempty(get_clipboard_entries()) then
		action = single_action
		target = "line"
	end

	action(target)
end

function D.open()
	local clipboard = get_clipboard_entries()
	local line = vim.api.nvim_get_current_line()

	if vim.tbl_isempty(clipboard) then
		expand_element()
		if not utils.is_directory(line) then
			close_drawer()
		end
	else
		vim.tbl_map(function(file)
			if vim.fn.isdirectory(file) == 0 then
				vim.cmd("e " .. file)
			end
		end, clipboard)

		close_drawer()
	end

	-- local buflist = vim.api.nvim_list_bufs()
end

function D.create()
	local line = vim.api.nvim_get_current_line()
	if utils.is_directory(line) then
		create(utils.get_element(line) .. utils.path_separator)
	else
		create(utils.get_path(line))
	end

	clear_clipboard()
end

function D.copy_and_paste(move)
	local line = vim.api.nvim_get_current_line()
	if utils.is_directory(line) then
		paste(move, utils.get_element(line) .. utils.path_separator)
	else
		paste(move, utils.get_path(line))
	end

	clear_clipboard()
end

return D
