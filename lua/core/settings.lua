-- show cursor always as a block
vim.opt.guicursor = ""

-- enable editor config
vim.g.editorconfig = true

-- enable mouse on normal and visual modes
vim.opt.mouse = "nv"

-- show relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- disable any kind of alert
vim.opt.errorbells = false

-- configure identation and tabs
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- highlight search
vim.opt.hlsearch = true
-- use incremental search
vim.opt.incsearch = true

-- avoid swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
-- create file with undo actions (undotree)
vim.opt.undofile = true
-- define a directory for undo actions (undotree)
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
-- enable copying from vim to the system clipboard
vim.opt.clipboard = "unnamedplus"

-- leave hidden buffers open
vim.opt.hidden = true

-- print colors on terminal
vim.opt.termguicolors = true

-- force cursor line to stay centered on the screen
vim.opt.scrolloff = 8

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight actual line
vim.opt.cursorline = true

-- show signs column at besides numbers column
vim.opt.signcolumn = "yes"

-- highlight column at 80 characters
vim.opt.colorcolumn = "80,100"

-- does not show mode on native status bar
vim.opt.showmode = false

-- avoid folding code
vim.opt.foldenable = false

-- control time until plugins are triggered on hover (gitsigns and lsp diagnostics)
vim.opt.updatetime = 500

-- define height of popups (cmp)
vim.opt.pumheight = 12

-- remove yankring clipboard (yanky)
vim.g.yankring_clipboard_monitor = 0

-- allow lua snippets
vim.g.snippets = "luasnip"

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
	end,
})

-- work with sessions
vim.opt.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"

-- make completion experience better
vim.o.completeopt = "menuone,noselect"

-- diagnostics simbols
local signs = { "Error", "Warn", "Info", "Hint" }
for _, severety in pairs(signs) do
	local hl = "DiagnosticSign" .. severety
	vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = hl })
end

-- disable native plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
