-- reusable functions
local K = {}

function K.noRemap(mode, key, map, desc)
	vim.keymap.set(mode, key, map, { noremap = true, desc = desc or "" })
end

function K.silentNoRemap(mode, key, map, desc)
	vim.keymap.set(mode, key, map, { noremap = true, silent = true, desc = desc or "" })
end

function K.bufferSilentNoRemap(mode, key, map, bufnr, desc)
	vim.keymap.set(mode, key, map, { noremap = true, silent = true, buffer = bufnr, desc = desc or "" })
end

-- keymaps
--- unassign function of enter, space, and keys
for _, key in ipairs({ "cr", "space", "bs" }) do
	K.noRemap({ "n", "v" }, "<" .. key .. ">", "<nop>")
end

-- unbind Q
K.noRemap("n", "Q", "<nop>")

--- close buffer
K.silentNoRemap({ "n" }, "<c-q>", "<cmd>bw<cr>") -- close

--- close terminal
K.silentNoRemap({ "t" }, "<c-q>", "<cmd>q<cr>") -- close

--- move on terminal terminal
K.silentNoRemap("t", "<esc>", "<c-\\><c-n>")
K.silentNoRemap("t", "<c-[>", "<c-\\><c-n>")
-- K.silentNoRemap("t", "<c-h>", "<cmd>wincmd h<cr>")
-- K.silentNoRemap("t", "<c-j>", "<cmd>wincmd j<cr>")
-- K.silentNoRemap("t", "<c-k>", "<cmd>wincmd k<cr>")
-- K.silentNoRemap("t", "<c-l>", "<cmd>wincmd l<cr>")

--- enhance functionality of ctrl+c
K.silentNoRemap({ "i" }, "<c-c>", "<esc>")

--- enhance dolar sign functionality
K.silentNoRemap("v", "$", "$h")

-- --- enhance copy functionality
-- K.silentNoRemap("x", "<leader>P", [["_dP]])

--- handle windows
K.noRemap({ "n", "v" }, "<c-w>s", "<nop>")
K.silentNoRemap({ "n", "v" }, "<c-w>x", "<cmd>new<cr>") -- open new file on horizontal split window
K.silentNoRemap({ "n", "v" }, "<c-w><c-x>", "<cmd>split<cr>") -- open same file on horizontal split window
K.silentNoRemap({ "n", "v" }, "<c-w>v", "<cmd>vnew<cr>") -- open new file on vertical split window
K.silentNoRemap({ "n", "v" }, "<c-w><c-v>", "<cmd>vsplit<cr>") -- open same file on vertical split window

--- save buffers without formatting
K.noRemap("c", "w!<cr>", "noa w<cr>") -- save
K.noRemap("c", "wa!<cr>", "noa wall<cr>") -- save all
K.noRemap("c", "wqa!<cr>", "wall<cr>:q<cr>") -- save all and quit

--- center cursor when searching next occurence
K.silentNoRemap("n", "n", "nzzzv") -- next
K.silentNoRemap("n", "N", "Nzzzv") -- previous

--- enter new line without going on insert mode
K.silentNoRemap("n", "<cr>", "m`o<esc>``")
K.silentNoRemap("n", "<s-cr>", "m`O<esc>``")

--- make y logic works similar to d/c logic
K.silentNoRemap("n", "Y", "y$")

--- refactoring
K.silentNoRemap({ "n", "v" }, "rg", '<cmd>lua require("user.nui").local_replace()<cr>')
K.silentNoRemap("n", "rl", "<cmd>let @/='\\<'.expand('<cword>').'\\>'<cr>cgn")
K.silentNoRemap("v", "rl", '"sy:let @/=@s<cr>cgn')

--- clear search highlight
K.silentNoRemap("n", "rh", "<cmd>noh<cr>")

--- handle buffers
K.silentNoRemap("n", "<c-f>", "<cmd>enew<cr>") -- open empty
K.silentNoRemap("n", "<c-b>", "<cmd>b#<cr>") -- jump to last

--- toggle relative number
K.silentNoRemap("n", "<leader>n", "<cmd>set rnu!<cr>")

--- disable arrow keys
for _, key1 in ipairs({ "<", "<c-", "<s-" }) do
	for _, key2 in ipairs({ "up>", "down>", "left>", "right>" }) do
		K.noRemap({ "n", "v", "i" }, key1 .. key2, "<nop>")
	end
end

-- export variable
return K
