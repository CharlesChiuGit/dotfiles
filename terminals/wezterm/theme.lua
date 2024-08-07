local wezterm = require("wezterm")

wezterm.GLOBAL.is_dark = wezterm.gui.get_appearance():find("Dark")

local Theme = {}

local themes = {
	gruvbox = {
		light = {
			rosewater = "#c14a4a",
			flamingo = "#c14a4a",
			pink = "#945e80",
			mauve = "#945e80",
			red = "#c14a4a",
			maroon = "#c14a4a",
			peach = "#c35e0a",
			yellow = "#a96b2c",
			green = "#6c782e",
			teal = "#4c7a5d",
			sky = "#4c7a5d",
			sapphire = "#4c7a5d",
			blue = "#45707a",
			lavender = "#45707a",
			text = "#654735",
			subtext1 = "#7b5d44",
			subtext0 = "#8f6f56",
			overlay2 = "#a28368",
			overlay1 = "#b6977a",
			overlay0 = "#c9aa8c",
			surface2 = "#A79C86",
			surface1 = "#C9C19F",
			surface0 = "#DFD6B1",
			base = "#fbf1c7",
			mantle = "#F3EAC1",
			crust = "#E7DEB7",
		},
		dark = {
			rosewater = "#EA6962",
			flamingo = "#EA6962",
			pink = "#D3869B",
			mauve = "#D3869B",
			red = "#EA6962",
			maroon = "#EA6962",
			peach = "#BD6F3E",
			yellow = "#D8A657",
			green = "#A9B665",
			teal = "#89B482",
			sky = "#89B482",
			sapphire = "#89B482",
			blue = "#7DAEA3",
			lavender = "#7DAEA3",
			text = "#D4BE98",
			subtext1 = "#BDAE8B",
			subtext0 = "#A69372",
			overlay2 = "#5A5E60",
			overlay1 = "#55595B",
			overlay0 = "#5F6365",
			surface2 = "#4B4F51",
			surface1 = "#3c3f40",
			surface0 = "#2d2f30",
			base = "#1D2021",
			mantle = "#191C1D",
			crust = "#151819",
		},
	},
	catppuccin = {
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
			base = "#EFF1F5",
			mantle = "#E6E9EF",
			crust = "#DCE0E8",
		},
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
	},
}

local THEME_NAME = "catppuccin"

local palettes = themes[THEME_NAME]

Theme.palette = wezterm.GLOBAL.is_dark and palettes.dark or palettes.light

Theme.colors = {
	split = Theme.palette.surface0,
	foreground = Theme.palette.text,
	background = Theme.palette.base,
	cursor_bg = Theme.palette.overlay2,
	cursor_border = Theme.palette.overlay2,
	cursor_fg = Theme.palette.base,
	selection_bg = Theme.palette.surface2,
	selection_fg = Theme.palette.text,
	visual_bell = Theme.palette.surface0,
	indexed = {
		[16] = Theme.palette.peach,
		[17] = Theme.palette.rosewater,
	},
	scrollbar_thumb = Theme.palette.surface2,
	compose_cursor = Theme.palette.flamingo,
	ansi = {
		Theme.palette.surface0,
		Theme.palette.red,
		Theme.palette.green,
		Theme.palette.yellow,
		Theme.palette.blue,
		Theme.palette.mauve,
		Theme.palette.teal,
		Theme.palette.text,
	},
	brights = {
		Theme.palette.surface2,
		Theme.palette.red,
		Theme.palette.green,
		Theme.palette.yellow,
		Theme.palette.blue,
		Theme.palette.mauve,
		Theme.palette.teal,
		Theme.palette.surface2,
	},
	tab_bar = {
		background = Theme.palette.mantle,
		active_tab = {
			bg_color = "none",
			fg_color = Theme.palette.subtext1,
			intensity = "Bold",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface1,
		},
		inactive_tab_hover = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface1,
		},
		new_tab = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.subtext0,
		},
		new_tab_hover = {
			bg_color = Theme.palette.mantle,
			fg_color = Theme.palette.surface2,
		},
	},
}

return Theme
