require("code_runner").setup({
	-- put here the commands by filetype
	mode = "toggleterm",
	filetype = {
		python = "python3 -u",
		c = "cd $dir && clang -lm -g $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
		PKGBUILD = "cd $dir && makepkg -scf",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
	},
})
