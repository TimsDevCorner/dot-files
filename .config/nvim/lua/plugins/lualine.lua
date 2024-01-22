return {
	-- status line
	'nvim-lualine/lualine.nvim',
	lazy = false,
	config = true,
	opts = {
		options = {
			theme = "nightfly"
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
