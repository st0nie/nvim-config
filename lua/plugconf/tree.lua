require("nvim-tree").setup({
	sort_by = "case_sensitive",
	sync_root_with_cwd = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	actions = {
		change_dir = {
			enable = true,
		},
	},
})
