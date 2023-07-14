local root_names = { ".git", "Makefile" }

local root_cache = {}

local set_root = function()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		return
	end
	path = vim.fs.dirname(path)

	local root = root_cache[path]
	if root == nil then
		local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
		if root_file == nil then
			return
		end
		root = vim.fs.dirname(root_file)
		root_cache[path] = root
	end

	vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup("MyAutoRoot", {})
vim.api.nvim_create_autocmd("BufEnter", { group = root_augroup, callback = set_root })
