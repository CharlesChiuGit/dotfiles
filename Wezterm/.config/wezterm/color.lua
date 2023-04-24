local M = {}
-- local is_dark = wezterm.gui.get_appearance():find("Dark")
M.is_dark = true

local catppuccin = {
	dark = {
		rosewater = "#F5E0DC",
		flamingo = "#F2CDCD",
		pink = "#F5C2E7",
		mauve = "#CBA6F7",
		red = "#F38BA8",
		maroon = "#EBA0AC",
		peach = "#FAB387",
		yellow = "#F9E2AF",
		green = "#A6E3A1",
		teal = "#94E2D5",
		sky = "#89DCEB",
		sapphire = "#74C7EC",
		blue = "#89B4FA",
		lavender = "#B4BEFE",

		text = "#CDD6F4",
		subtext1 = "#BAC2DE",
		subtext0 = "#A6ADC8",
		overlay2 = "#9399B2",
		overlay1 = "#7F849C",
		overlay0 = "#6C7086",
		surface2 = "#585B70",
		surface1 = "#45475A",
		surface0 = "#313244",

		base = "#1E1E2E",
		mantle = "#181825",
		crust = "#11111B",
	},
	light = {
		rosewater = "#dc8a78",
		flamingo = "#DD7878",
		pink = "#ea76cb",
		mauve = "#8839EF",
		red = "#D20F39",
		maroon = "#E64553",
		peach = "#FE640B",
		yellow = "#df8e1d",
		green = "#40A02B",
		teal = "#179299",
		sky = "#04A5E5",
		sapphire = "#209FB5",
		blue = "#1e66f5",
		lavender = "#7287FD",

		text = "#4C4F69",
		subtext1 = "#5C5F77",
		subtext0 = "#6C6F85",
		overlay2 = "#7C7F93",
		overlay1 = "#8C8FA1",
		overlay0 = "#9CA0B0",
		surface2 = "#ACB0BE",
		surface1 = "#BCC0CC",
		surface0 = "#CCD0DA",

		base = "#FFFFFF",
		mantle = "#E6E9EF",
		crust = "#DCE0E8",
	},
}

M.colors = M.is_dark and catppuccin.dark or catppuccin.light

M.wezcolor = {
	split = M.colors.surface0,
	foreground = M.colors.text,
	background = M.colors.base,
	cursor_bg = M.colors.rosewater,
	cursor_border = M.colors.rosewater,
	cursor_fg = M.is_dark and M.colors.base or M.colors.crust,
	selection_bg = M.colors.surface2,
	selection_fg = M.colors.text,
	visual_bell = M.colors.surface0,
	indexed = {
		[16] = M.colors.peach,
		[17] = M.colors.rosewater,
	},
	scrollbar_thumb = M.colors.surface2,
	compose_cursor = M.colors.flamingo,
	ansi = {
		M.is_dark and M.colors.subtext1 or M.colors.surface1,
		M.colors.red,
		M.colors.green,
		M.colors.yellow,
		M.colors.blue,
		M.colors.pink,
		M.colors.teal,
		M.is_dark and M.colors.surface2 or M.colors.subtext1,
	},
	brights = {
		M.is_dark and M.colors.subtext0 or M.colors.surface2,
		M.colors.red,
		M.colors.green,
		M.colors.yellow,
		M.colors.blue,
		M.colors.pink,
		M.colors.teal,
		M.is_dark and M.colors.surface1 or M.colors.subtext0,
	},
	tab_bar = {
		background = M.colors.crust,
		active_tab = {
			bg_color = "none",
			fg_color = M.colors.subtext1,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = M.colors.crust,
			fg_color = M.colors.surface2,
		},
		inactive_tab_hover = {
			bg_color = M.colors.mantle,
			fg_color = M.colors.subtext0,
		},
		new_tab = {
			bg_color = M.colors.crust,
			fg_color = M.colors.subtext0,
		},
		new_tab_hover = {
			bg_color = M.colors.crust,
			fg_color = M.colors.subtext0,
		},
	},
}

return M
