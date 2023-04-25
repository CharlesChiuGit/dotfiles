local wezterm = require("wezterm")
local M = {}

function M.setup(config)
	config.term = "" -- Set to empty so FZF works on windows
	config.default_prog = { "pwsh.exe" }
	table.insert(config.launch_menu, {
		label = "pwsh",
		args = { "pwsh.exe", "-NoLogo" },
	})

	table.insert(config.launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
	})
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		-- Find installed visual studio version(s) and add their compilation
		-- environment command prompts to the menu
		for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
			local year = vsvers:gsub("Microsoft Visual Studio/", "")
			table.insert(config.launch_menu, {
				label = "x64 Native Tools VS " .. year,
				args = {
					"cmd.exe",
					"/k",
					"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
				},
			})
		end
	end
end

return M
