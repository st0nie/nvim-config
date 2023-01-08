require("code_runner").setup({
	-- put here the commands by filetype
	filetype = {
		python = "python3 -u",
		c = "cd $dir && clang $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
		PKGBUILD = "cd $dir && makepkg -scf",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
	},
	project = {
		["~/工作区/go-musicfox"] = {
			name = "musicfox",
			discription = "Command-line Netease Cloud Music written in Go",
			command = "go run ./cmd/musicfox.go",
		},
	},
})
