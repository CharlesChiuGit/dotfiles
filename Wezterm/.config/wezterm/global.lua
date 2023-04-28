local M = {}
local wezterm = require("wezterm")
local os_name = os.getenv("OS")

function M:load_variables()
	self.is_windows = os_name == "Windows_NT"
	self.is_macos = os_name == "Darwin"
	self.is_linux = os_name == "Linux"
	local win_home = self.is_windows and os.getenv("USERPROFILE") or wezterm.home_dir
	if self.is_windows then
		win_home = string.gsub(win_home, "\\", "/")
	end
	self.home = self.is_windows and win_home or os.getenv("HOME")
end

M:load_variables()

return M
