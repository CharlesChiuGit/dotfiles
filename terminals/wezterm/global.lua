local M = {}
local wezterm = require("wezterm")
local os_name = os.getenv("OS")

local function getOS()
	local osname = ""
	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	else
		print(err)
	end
	return osname
end

os_name = os_name or getOS()

function M:load_variables()
	self.is_windows = os_name == "Windows_NT"
	self.is_macos = os_name == "Darwin"
	self.is_linux = os_name == "GNU/Linux"
	local home = wezterm.home_dir
	if self.is_windows then
		home = home:gsub("\\", "/")
	elseif self.is_linux then
		home = home:sub(1)
	elseif self.is_macos then
		home = home:gsub("file://", "")
	end
	self.home = home
end

M:load_variables()

return M
