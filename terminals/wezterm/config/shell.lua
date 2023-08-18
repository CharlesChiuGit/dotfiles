local global = require("global")

if global.is_windows then
	return { "pwsh.exe" }
else
	return { "zsh" }
end
