return {
	'stevearc/oil.nvim',
	lazy = false,
	config = function()
		require('oil').setup({
			view_options = {
				show_hidden = true,
				sort = {
					{ "name", "asc" },
				},
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
