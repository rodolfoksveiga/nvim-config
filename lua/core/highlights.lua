-- functions
local function setHighlightGroup(highlightGroup, opts)
	vim.api.nvim_set_hl(0, highlightGroup, opts)
end

-- general
setHighlightGroup("Visual", { bg = "#363a4f" })
setHighlightGroup("NormalFloat", { bg = "#24273a" })
setHighlightGroup("FloatBorder", { bg = "#24273a", fg = "#cad3f5" })
setHighlightGroup("CursorLineNr", { fg = "#cdd6f4" })
setHighlightGroup("ColorColumn", { bg = "#363a4f" })

-- search
setHighlightGroup("IncSearch", { bg = "#eed49f", fg = "#24273a" })
setHighlightGroup("Search", { bg = "#494d64" })
setHighlightGroup("CurSearch", { bg = "#f5a97f", fg = "#24273a" })
setHighlightGroup("FzfLuaSearch", { bg = "#f5a97f", fg = "#24273a" })
