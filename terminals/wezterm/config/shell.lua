local global = require("global")

if global.is_windows then
	return { "C:\\Program Files\\Git\\usr\\bin\\zsh.exe" }
else
	return { "zsh" }
end
