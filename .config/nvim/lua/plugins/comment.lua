return {
	'terrortylor/nvim-comment',
	lazy = false,
	config = function()
		require('nvim_comment').setup({
			hook = function()
				require('ts_context_commentstring.internal').update_commentstring()
			end,
		})
	end,
	dependencies = {
		-- To customize commentstring for e.g. svelte files, as the commentstring is depending on cursor position
		'JoosepAlviste/nvim-ts-context-commentstring'
	}
}
