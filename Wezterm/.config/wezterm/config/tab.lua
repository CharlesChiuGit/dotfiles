local wezterm = require("wezterm")
local palette = require("theme").palette
local global = require("global")

local Tab = {}

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = palette.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = palette.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = palette.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = palette.green } },
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = palette.green } },
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = palette.peach } },
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = palette.subtext0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = palette.lavender } },
			{ Text = wezterm.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = palette.yellow } },
			{ Text = wezterm.nerdfonts.cod_pulse },
		},
		["btop"] = {
			{ Foreground = { Color = palette.rosewater } },
			{ Text = wezterm.nerdfonts.cod_pulse },
		},
		["cargo"] = {
			{ Foreground = { Color = palette.peach } },
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = palette.sapphire } },
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = palette.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = palette.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = palette.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = palette.blue } },
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = palette.yellow } },
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = palette.yellow } },
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = palette.mauve } },
			{ Text = wezterm.nerdfonts.dev_github_badge },
		},
		["flatpak"] = {
			{ Foreground = { Color = palette.blue } },
			{ Text = wezterm.nerdfonts.mdi_package_variant },
		},
		["tmux"] = {
			{ Foreground = { Color = palette.green } },
			{ Text = wezterm.nerdfonts.cod_terminal_tmux },
		},
		["ssh"] = {
			{ Foreground = { Color = palette.sapphire } },
			{ Text = wezterm.nerdfonts.cod_remote },
		},
		["cmd.exe"] = {
			{ Foreground = { Color = palette.overlay2 } },
			{ Text = wezterm.nerdfonts.cod_terminal_cmd },
		},
		["pwsh.exe"] = {
			{ Foreground = { Color = palette.overlay0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_powershell },
		},
		["powershell.exe"] = {
			{ Foreground = { Color = palette.mantle } },
			{ Text = wezterm.nerdfonts.cod_terminal_powershell },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	if process_name == "" then
		process_name = "zsh"
	end

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = palette.sky } }, { Text = string.format("[%s]", process_name) } }
	)
end

local function get_current_working_folder_name(tab)
	local cwd_uri = tab.active_pane.current_working_dir
	cwd_uri = global.is_linux and cwd_uri:sub(8) or cwd_uri:sub(9)

	local cwd = cwd_uri
	if global.is_linux then
		local slash_index = cwd_uri:find("/")
		cwd = cwd_uri:sub(slash_index)
	elseif global.is_windows then
		cwd = cwd_uri:sub(1, -2)
	end

	if cwd == global.home then
		return "  ~"
	end

	return string.format("  %s", string.match(cwd, "[^/]+$"))
end

function Tab.setup()
	wezterm.on("format-tab-title", function(tab)
		return wezterm.format({
			{ Attribute = { Intensity = "Half" } },
			{ Foreground = { Color = palette.surface2 } },
			{ Text = string.format(" %s  ", tab.tab_index + 1) },
			"ResetAttributes",
			{ Text = get_process(tab) },
			{ Text = " " },
			{ Text = get_current_working_folder_name(tab) },
			{ Foreground = { Color = palette.base } },
			{ Text = "  ▕" },
		})
	end)
	wezterm.on("update-right-status", function(window)
		local date = wezterm.strftime("%Y-%m-%d %H:%M:%S ")
		window:set_right_status(wezterm.format({
			{ Text = date },
		}))
	end)
end

return Tab
