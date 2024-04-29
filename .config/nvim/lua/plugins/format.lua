return {
	'stevearc/conform.nvim',
	lazy = false,
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			svelte = { "prettier" },
			vue = { "prettier" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 1500,
		},
	},
	config = function(_, opts)
		local plug = require('conform')
		plug.setup(opts)

		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*",
		-- 	callback = function(args)
		-- 		plug.format({ bufnr = args.buf })
		-- 	end,
		-- })
	end,
}
