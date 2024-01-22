return {
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		config = function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require('mason-lspconfig').setup {
				ensure_installed = { 'rust_analyzer', 'lua_ls', 'kotlin_language_server' },
				handlers = {
					lsp_zero.default_setup,
					kotlin_language_server = function()
						require('lspconfig').kotlin_language_server.setup({
							settings = { kotlin = { compiler = { jvm = { target = "17" } } } }
						})
					end,
				} }
		end,
	},

	{ 'VonHeikemen/lsp-zero.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		lazy = false,
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					-- add Ctrl+z to default keymap from lsp-zero as replacement to Ctrl+y on german keyboard layout
					['<C-z>'] = cmp.mapping.confirm({ select = true }),
				})
			})
		end
	},
	{ 'L3MON4D3/LuaSnip' },
}
