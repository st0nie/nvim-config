local dap, dapui = require("dap"), require("dapui")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-dap",
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			local path = vim.fn.getcwd() .. "/"
			local exe = vim.fn.expand("%:p:r")
			if vim.fn.empty(vim.fn.glob(exe)) == 0 then
				path = exe
			end
			return vim.fn.input("Path to executable: ", path, "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		runInTerminal = true,
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- dap ui
require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- dap icon
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "error" })

-- dap-virtual-text
require("nvim-dap-virtual-text").setup()
