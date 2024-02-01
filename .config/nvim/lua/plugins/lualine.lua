return {
	-- status line
	'nvim-lualine/lualine.nvim',
	lazy = false,
	config = true,
	opts = {
		options = {
			theme = "everforest",
		},
	},
	dependencies = { 'nvim-tree/nvim-web-devicons' }
}
