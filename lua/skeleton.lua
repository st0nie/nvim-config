-- ebuild skeleton
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "*.ebuild",
	callback = function()
		vim.cmd("0r ~/Templates/skeleton.ebuild")
		vim.cmd("0r /var/db/repos/gentoo/header.txt | $d | 0")
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "metadata.xml",
	command = "r ~/Templates/metadata.xml | 0d",
})

-- bash shebang
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "*.sh",
	command = "r ~/Templates/skeleton.sh | 0d",
})
