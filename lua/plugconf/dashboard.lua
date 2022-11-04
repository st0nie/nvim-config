local db = require("dashboard")
db.custom_header = {
	"                                                  ",
	"                                                  ",
	"                                                  ",
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                                                  ",
	"                                                  ",
	"                                                  ",
}
db.custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session      ",
		action = "source ~/.vim_recently_session",
	},
	{
		icon = "  ",
		desc = "Recently opened files        ",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Find File                    ",
		action = "Telescope find_files",
	},
	{
		icon = "  ",
		desc = "File Browser                 ",
		action = "edit ./",
	},
	{
		icon = "  ",
		desc = "Find word                    ",
		action = "Telescope live_grep",
	},
	{
		icon = "  ",
		desc = "Open Personal dotfiles       ",
		action = "edit ~/.config/nvim",
	},
}
