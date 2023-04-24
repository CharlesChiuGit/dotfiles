local M = {}

local wezterm = require("wezterm")

M.keymap = {
	{
		mods = "ALT",
		key = [[\]],
		action = wezterm.action({
			SplitHorizontal = { domain = "CurrentPaneDomain" },
		}),
	},
	{
		mods = "ALT|SHIFT",
		key = [[|]],
		action = wezterm.action.SplitPane({
			top_level = true,
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		mods = "ALT",
		key = [[-]],
		action = wezterm.action({
			SplitVertical = { domain = "CurrentPaneDomain" },
		}),
	},
	{
		mods = "ALT|SHIFT",
		key = [[-]],
		action = wezterm.action.SplitPane({
			top_level = true,
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		mods = "ALT",
		key = "n",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		mods = "ALT",
		key = "Q",
		action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
	},
	{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
	{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "j", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	{ key = "k", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },

	{ key = "h", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "ALT", action = wezterm.action.EmitEvent("ActivatePaneDirection-right") },

	{ key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "[", mods = "ALT|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "]", mods = "ALT|SHIFT", action = wezterm.action.MoveTabRelative(1) },
	{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
	{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
}

return M
