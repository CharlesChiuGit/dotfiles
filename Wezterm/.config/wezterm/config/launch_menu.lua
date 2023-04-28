local global = require("global")

local launch_menu = {}

if global.is_windows then
	launch_menu = {
		{
			label = "PowerShell Core",
			args = { "pwsh" },
		},
		{
			label = "Command Prompt",
			args = { "cmd" },
		},
		{
			label = "Git Bash",
			args = { "C:\\Program Files\\Git\\git-bash.exe" },
		},
		{
			label = "Windows PowerShell",
			args = { "powershell" },
		},
	}
else
	launch_menu = {
		{ label = "zsh", args = { "/usr/bin/bash" } },
		{ label = "bash", args = { "/usr/bin/bash" } },
	}
end

return launch_menu
