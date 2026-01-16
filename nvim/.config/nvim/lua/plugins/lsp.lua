return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- Mason automatically installs LSPs, linters, formatters, etc.
		{
			"williamboman/mason.nvim",
			opts = {},
		},
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		--
		-- Callback for 'LspAttach' event
		--
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				--
				-- Set useful keymaps for LSP functionality
				--
				local function map(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("gt", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ra", vim.lsp.buf.rename, "[R]en[a]me")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions", { "n", "x" })
			end,
		})

		--
		-- Configure diagnostics (warnings, errors, etc.)
		--
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.WARN },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
			virtual_text = {
				source = false,
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		-- Set defaults for most LSPs
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- List LSP servers to install (configure if necessary):
		-- installation is handled by `mason-tool-installer`
		local servers = {
			-- C/C++
			cmake = {},
			clangd = {
				capabilities = capabilities,
				cmd = { "clangd", "--background-index", "--clang-tidy" },
			},

			-- Other languages
			ts_ls = {},
			pyright = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
		}
		-- Extra utility packages (formatters, etc.)
		local extras = {
			"stylua",
			"clang-format",
			"black",
			"prettier",
			"xmlformatter",
		}

		-- Populate list of packages for 'mason-tool-installer' to install
		-- Add LSPs from `servers` table above, along with extras, then install them
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, extras)
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		--
		-- Set up nvim-lspconfig for listed servers
		--
		require("mason-lspconfig").setup({
			-- No automatic install necessary: package install is handled by 'mason-tool-installer'
			ensure_installed = {},
			automatic_installation = false,

			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
