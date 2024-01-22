local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "

require("lazy").setup("plugins")

-- line numbers
vim.opt.rnu = true
vim.opt.nu = true

-- search
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- tabstops
vim.opt.ts = 2
vim.opt.sw = 2

--folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

--clipboard
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
	-- group = vim.api.nvim_create_augroup('highlight_yank' ),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
	end,
})
