local wezterm = require("wezterm")
local theme = require("theme")
local global = require("global")

-- load configs
local keymap = require("config.keymap")
local launch_menu = require("config.launch_menu")
local shell = require("config.shell")
-- require("config.notify").setup()
require("config.tab").setup()

local config = {}

-- Use the config_builder to provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- selene: allow(unused_variable)
---@diagnostic disable-next-line: unused-function, unused-local
local function enable_wayland()
	local session = os.getenv("XDG_SESSION_TYPE")
	if session == "wayland" then
		return true
	end
	return false
end

local function font_with_fallback(name, params)
	local names = { name, "Apple Color Emoji" }
	return wezterm.font_with_fallback(names, params)
end

local FONT_NAME = "IntoneMono NFP"
-- local FONT_NAME = "JetBrainsMono NFP"

config = {
	font = font_with_fallback(FONT_NAME),
	font_size = 12,
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(FONT_NAME, { italic = true }),
		},
		{
			italic = false,
			font = font_with_fallback(FONT_NAME, { bold = false }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(FONT_NAME, { bold = true }),
		},
	},
	warn_about_missing_glyphs = false,
	dpi = 96.0,
	max_fps = 120,
	underline_thickness = "200%",
	underline_position = "-3pt",
	enable_wayland = false,
	window_background_opacity = 0.9,
	pane_focus_follows_mouse = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1,
	default_cursor_style = "SteadyBar",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 10,
		right = 0,
		top = 0,
		bottom = 0,
	},
	initial_cols = 110,
	initial_rows = 25,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = wezterm.GLOBAL.is_dark and 0.7 or 0.7,
	},
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = true,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = false,
	disable_default_key_bindings = false,
	use_ime = true,
	xim_im_name = "fcitx5",
	-- front_end = "OpenGL",
	-- https://github.com/wez/wezterm/issues/2756
	webgpu_power_preference = "HighPerformance",
	-- term = "wezterm",
	-- set term to wezterm will break the nvim titlestring option, see https://github.com/wez/wezterm/issues/2112
	term = "xterm-256color",
	bold_brightens_ansi_colors = true,
	colors = theme.colors,
	keys = keymap.keymap,
	hyperlink_rules = wezterm.default_hyperlink_rules(),
	default_prog = shell,
	launch_menu = launch_menu,
}

local hyprlink_rules = {
	{
		regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
		format = "$0",
	},
	{
		regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
		format = "$0",
	},
	{
		regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
		format = "mailto:$0",
	},
	{
		regex = [[\bfile://\S*\b]],
		format = "$0",
	},
	{
		regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
		format = "$0",
	},
	{
		regex = [[\b[tT](\d+)\b]],
		format = "https://example.com/tasks/?t=$1",
	},
	{
		regex = [[["'\s]([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["'\s]] .. "]",
		format = "https://www.github.com/$1/$3",
	},
}

for _, rule in ipairs(hyprlink_rules) do
	table.insert(config.hyperlink_rules, rule)
end

for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Dx12" and gpu.device_type == "DiscreteGpu" then
		config.front_end = "WebGpu"
		config.webgpu_preferred_adapter = gpu
		config.webgpu_power_preference = "HighPerformance"
		config.webgpu_force_fallback_adapter = true
		break
	elseif gpu.backend == "Vulkan" and gpu.device_type == "DiscreteGpu" then
		config.front_end = "WebGpu"
		config.webgpu_preferred_adapter = gpu
		config.webgpu_power_preference = "HighPerformance"
		config.webgpu_force_fallback_adapter = true
		break
	elseif gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
		config.front_end = "WebGpu"
		config.webgpu_preferred_adapter = gpu
		config.webgpu_power_preference = "LowPower"
		config.webgpu_force_fallback_adapter = true
		break
	end
end

return config
