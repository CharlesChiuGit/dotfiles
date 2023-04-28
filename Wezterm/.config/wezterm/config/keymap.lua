local wezterm = require("wezterm")

local Keys = {}

local function is_vi_process(pane)
	return pane:get_foreground_process_name():find("n?vim") ~= nil
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "ALT|SHIFT" or "ALT",
		action = wezterm.action_callback(function(win, pane)
			if is_vi_process(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "ALT|SHIFT" or "ALT" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

local function better_close(mods, key)
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			if is_vi_process(pane) then
				win:perform_action({
					SendKey = { key = key, mods = mods },
				}, pane)
			else
				win:perform_action({ CloseCurrentPane = { confirm = false } }, pane)
			end
		end),
	}
end

Keys.keymap = {
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
		mods = "ALT|SHIFT",
		key = "q",
		action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
	},
	better_close("ALT", "q"),
	{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
	split_nav("focus", "h"),
	split_nav("focus", "j"),
	split_nav("focus", "k"),
	split_nav("focus", "l"),
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

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
}

for i = 1, 9 do
	table.insert(Keys.keymap, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

return Keys
