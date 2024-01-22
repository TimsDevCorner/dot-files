return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
	opts = {
		style = "moon",
		on_colors = function(colors)
			colors.fg_gutter = colors.orange
		end,
	},
	config = function(_, opts)
		require('tokyonight').setup(opts)
		vim.cmd([[colorscheme tokyonight]])
	end,
}
