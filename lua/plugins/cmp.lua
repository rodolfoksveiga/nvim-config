return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
	config = function()
		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				}),
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				}),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<c-space>"] = cmp.mapping.complete(),
				["<c-y>"] = cmp.mapping.confirm({ select = true }),
				["<c-e>"] = cmp.mapping.abort(),
				["<c-d>"] = cmp.mapping.scroll_docs(2),
				["<c-u>"] = cmp.mapping.scroll_docs(-2),
				["g)"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["g("] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "buffer" },
			}),
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
				{ name = "cmp_git" },
			}),
		})

		cmp.setup.filetype({ "gitcommit", "txt" }, {
			sources = cmp.config.sources({
				{ name = "buffer" },
			}),
		})

		cmp.setup.filetype("markdown", {
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "buffer" },
			}),
		})

		cmp.setup.filetype("norg", {
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "buffer" },
				{ name = "neorg" },
			}),
		})
	end,
}
