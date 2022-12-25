-- ebuild skeleton
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "*.ebuild",
	callback = function()
		vim.cmd("0r ~/模板/skeleton.ebuild")
		vim.cmd("0r /var/db/repos/gentoo/header.txt")
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "metadata.xml",
	command = "0r ~/模板/metadata.xml",
})

-- bash shebang
vim.api.nvim_create_autocmd({ "BufNewFile" }, {
	pattern = "*.sh",
	command = "0r ~/模板/skeleton.sh",
})
