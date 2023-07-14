return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"ibhagwan/fzf-lua",
		"jose-elias-alvarez/null-ls.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	keys = {
		{ "<leader>mi", "<cmd>LspInfo<cr>", desc = "LSP" },
	},
	config = function()
		-- on attach
		local bufferSilentNoRemap = require("core.keymaps").bufferSilentNoRemap
		local nui = require("user.nui")
		local fzf = require("fzf-lua")

		local function onAttach(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false

			if client.name == "tsserver" or client.name == "pyright" then
				-- bufferSilentNoRemap("c", "w", function()
				-- 	vim.lsp.buf.execute_command({
				-- 		command = "_typescript.organizeImports",
				-- 		arguments = { vim.api.nvim_buf_get_name(0) },
				-- 		title = "Format",
				-- 	})
				-- 	vim.cmd("w")
				-- end, bufnr, "Save and Format")
			end

			if client.name == "gopls" then
				-- vim.api.nvim_create_autocmd("BufWritePre", {
				-- 	pattern = { "*.go" },
				-- 	callback = function()
				-- 		local params = vim.lsp.util.make_range_params(nil, "utf-16")
				-- 		params.context = { only = { "source.organizeImports" } }
				-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
				-- 		for _, res in pairs(result or {}) do
				-- 			for _, r in pairs(res.result or {}) do
				-- 				if r.edit then
				-- 					vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
				-- 				else
				-- 					vim.lsp.buf.execute_command(r.command)
				-- 				end
				-- 			end
				-- 		end
				-- 	end,
				-- })
			end

			if client.name == "eslint" then
				client.server_capabilities.codeActionProvider = false
			end

			bufferSilentNoRemap("n", "K", vim.lsp.buf.hover, bufnr)
			bufferSilentNoRemap("n", "rp", function()
				nui.project_rename()
			end, bufnr)
			bufferSilentNoRemap("n", "gf", function()
				nui.code_actions()
			end, bufnr)
			bufferSilentNoRemap("n", "gn", vim.diagnostic.goto_next, bufnr)
			bufferSilentNoRemap("n", "gp", vim.diagnostic.goto_prev, bufnr)
			bufferSilentNoRemap("n", "gd", function()
				vim.lsp.buf.definition({
					on_list = function(list)
						local count = 0
						for _ in pairs(list["items"]) do
							count = count + 1
						end
						if count > 1 then
							fzf.lsp_definitions()
						else
							vim.lsp.buf.definition()
						end
					end,
				})
			end, bufnr)
			bufferSilentNoRemap("n", "gr", function()
				vim.lsp.buf.references(nil, {
					on_list = function(list)
						local count = 0
						for _ in pairs(list["items"]) do
							count = count + 1
						end
						if count > 1 then
							fzf.lsp_references()
						else
							fzf.utils.info("Only the current reference was found.")
						end
					end,
				})
			end, bufnr)
			bufferSilentNoRemap("n", "go", vim.diagnostic.open_float, bufnr)
			bufferSilentNoRemap("n", "gs", vim.diagnostic.show, bufnr)
			bufferSilentNoRemap("n", "gh", vim.diagnostic.hide, bufnr)
			bufferSilentNoRemap("n", "<leader>fe", function()
				require("fzf-lua").lsp_workspace_diagnostics({
					winopts = {
						height = 0.3,
						width = 0.5,
						preview = {
							hidden = "hidden",
							layout = "vertical",
						},
					},
				})
			end, bufnr, "Find diagnostic")
			bufferSilentNoRemap("n", "<leader>lu", vim.cmd.LspStart, bufnr, "Up")
			bufferSilentNoRemap("n", "<leader>ld", vim.cmd.LspStop, bufnr, "Down")
			bufferSilentNoRemap("n", "<leader>lr", vim.cmd.LspRestart, bufnr, "Restart")
			bufferSilentNoRemap("n", "<leader>li", vim.cmd.LspInfo, bufnr, "Info")

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			-- deactivate diagnostics for helm files
			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufEnter" }, {
				group = vim.api.nvim_create_augroup("DrexDrawerWindow", {}),
				pattern = "*.helm.yaml",
				callback = function(args)
					vim.diagnostic.disable(0)
				end,
			})
		end

		-- general configuration
		local lspConfig = require("lspconfig")

		-- add borders
		require("lspconfig.ui.windows").default_options.border = "rounded"

		--- open diagnostics only on hover
		vim.diagnostic.config({
			float = { border = "rounded" },
			virtual_text = false,
			update_in_insert = false,
			severity_sort = true,
			underline = false,
		})

		-- language specific configuration
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- rust
		lspConfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = onAttach,
			root_dir = lspConfig.util.root_pattern("Cargo.toml"),
		})

		--- lua
		lspConfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = onAttach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		--- javascript/typescript
		---- tsserver
		lspConfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
		---- eslint
		lspConfig.eslint.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})

		--- json
		local jsonCapabilities = capabilities
		jsonCapabilities.textDocument.completion.completionItem.snippetSupport = true
		lspConfig.jsonls.setup({
			capabilities = jsonCapabilities,
			on_attach = onAttach,
		})

		--- yaml
		lspConfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
			settings = {
				yaml = {
					keyOrdering = false,
					schemas = {
						kubernetes = "*.y*ml",
						-- ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.y*ml",
					},
				},
			},
		})

		--- html
		lspConfig.html.setup({
			capabilities = capabilities,
			on_attach = onAttach,
			filetypes = { "html", "htmldjango", "django-html" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
		})

		--- terraform
		lspConfig.terraformls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})

		--- python
		lspConfig.pyright.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})

		--- go
		lspConfig.gopls.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})

		--- markdown
		lspConfig.marksman.setup({
			capabilities = capabilities,
			on_attach = onAttach,
		})
	end,
}
