---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### General Configuration --------------------------------------------------
--
-- The general configuration properties are grouped together in
-- `xplr.config.general`.

-- Set it to `true` if you want to ignore the startup errors. You can still see
-- the errors in the logs.
--
-- Type: boolean
xplr.config.general.disable_debug_error_mode = false

-- Set it to `true` if you want to enable mouse scrolling.
--
-- Type: boolean
xplr.config.general.enable_mouse = true

-- Set it to `true` to show hidden files by default.
--
-- Type: boolean
xplr.config.general.show_hidden = true

-- Set it to `true` to use only a subset of selected operations that forbids
-- executing commands or performing write operations on the file-system.
--
-- Type: boolean
xplr.config.general.read_only = false

-- Set it to `true` if you want to enable a safety feature that will save you
-- from yourself when you type recklessly.
--
-- Type: boolean
xplr.config.general.enable_recover_mode = false

-- Set it to `true` if you want to hide all remaps in the help menu.
--
-- Type: boolean
xplr.config.general.hide_remaps_in_help_menu = false

-- Set it to `true` if you want the cursor to stay in the same position when
-- the focus is on the first path and you navigate to the previous path
-- (by pressing `up`/`k`), or when the focus is on the last path and you
-- navigate to the next path (by pressing `down`/`j`).
-- The default behavior is to rotate from the last/first path.
--
-- Type: boolean
xplr.config.general.enforce_bounded_index_navigation = false

-- This is the shape of the prompt for the input buffer.
--
-- Type: nullable string
xplr.config.general.prompt.format = "❯ "

-- This is the style of the prompt for the input buffer.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.prompt.style = {}

-- The string to indicate an information in logs.
--
-- Type: nullable string
xplr.config.general.logs.info.format = "INFO"

-- The style for the informations logs.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.logs.info.style = { fg = "LightBlue" }

-- The string to indicate an success in logs.
--
-- Type: nullable string
xplr.config.general.logs.success.format = "SUCCESS"

-- The style for the success logs.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.logs.success.style = { fg = "Green" }

-- The string to indicate an warnings in logs.
--
-- Type: nullable string
xplr.config.general.logs.warning.format = "WARNING"

-- The style for the warnings logs.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.logs.warning.style = { fg = "Yellow" }

-- The string to indicate an error in logs.
--
-- Type: nullable string
xplr.config.general.logs.error.format = "ERROR"

-- The style for the error logs.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.logs.error.style = { fg = "Red" }

-- Columns to display in the table header.
--
-- Type: nullable list of tables with the following fields:
--
-- * format: nullable string
-- * style: [Style](https://xplr.dev/en/style)
xplr.config.general.table.header.cols = {
  { format = " index", style = {} },
  { format = "╭─── path", style = {} },
  { format = "permissions", style = {} },
  { format = "size", style = {} },
  { format = "modified", style = {} },
}

-- Style of the table header.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.table.header.style = {}

-- Height of the table header.
--
-- Type: nullable integer
xplr.config.general.table.header.height = 1

-- Columns to display in each row in the table.
--
-- Type: nullable list of tables with the following fields:
--
-- * format: nullable string
-- * style: [Style](https://xplr.dev/en/style)
xplr.config.general.table.row.cols = {
  {
    format = "builtin.fmt_general_table_row_cols_0",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_1",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_2",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_3",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_4",
    style = {},
  },
}

-- Default style of the table.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.table.row.style = {}

-- Height of the table rows.
--
-- Type: nullable integer
xplr.config.general.table.row.height = 0

-- Default style of the table.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.table.style = {}

-- Tree to display in the table.
--
-- Type: nullable list of tables with the following fields:
--
-- * format: nullable string
-- * style: [Style](https://xplr.dev/en/style)
xplr.config.general.table.tree = {
  { format = "├", style = {} },
  { format = "├", style = {} },
  { format = "╰", style = {} },
}

-- Spacing between the columns in the table.
--
-- Type: nullable integer
xplr.config.general.table.col_spacing = 1

-- Constraint for the column widths.
--
-- Type: nullable list of [Constraint](https://xplr.dev/en/layouts#constraint)
xplr.config.general.table.col_widths = {
  { Percentage = 10 },
  { Percentage = 50 },
  { Percentage = 10 },
  { Percentage = 10 },
  { Percentage = 20 },
}

-- The content that is placed before the item name for each row by default.
--
-- Type: nullable string
xplr.config.general.default_ui.prefix = "─ "

-- The content which is appended to each item name for each row by default.
--
-- Type: nullable string
xplr.config.general.default_ui.suffix = ""

-- The default style of each item for each row.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.default_ui.style = {}

-- The string placed before the item name for a focused row.
--
-- Type: nullable string
xplr.config.general.focus_ui.prefix = "▸["

-- The string placed after the item name for a focused row.
--
-- Type: nullable string
xplr.config.general.focus_ui.suffix = "]"

-- Style for focused item.
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.focus_ui.style = { add_modifiers = { "Bold" } }

-- The string placed before the item name for a selected row.
--
-- Type: nullable string
xplr.config.general.selection_ui.prefix = "─{"

-- The string placed after the item name for a selected row.
--
-- Type: nullable string
xplr.config.general.selection_ui.suffix = "}"

-- Style for selected rows.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.selection_ui.style = {
  fg = "LightGreen",
  add_modifiers = { "Bold" },
}

-- The string placed before item name for a selected row that gets the focus.
--
-- Type: nullable string
xplr.config.general.focus_selection_ui.prefix = "▸["

-- The string placed after the item name for a selected row that gets the focus.
--
-- Type: nullable string
xplr.config.general.focus_selection_ui.suffix = "]"

-- Style for a selected row that gets the focus.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.focus_selection_ui.style = {
  fg = "LightGreen",
  add_modifiers = { "Bold" },
}

-- The shape of the separator for the Sort & filter panel.
--
-- Type: nullable string
xplr.config.general.sort_and_filter_ui.separator.format = " › "

-- The style of the separator for the Sort & filter panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.separator.style = {
  add_modifiers = { "Dim" },
}

-- The content of the default identifier in Sort & filter panel.
--
-- Type: nullable string
xplr.config.general.sort_and_filter_ui.default_identifier.format = nil

-- Style for the default identifier in Sort & filter panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.default_identifier.style = {}

-- The shape of the forward direction indicator for sort identifiers in Sort & filter panel.
--
-- Type: nullable string
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.format = "↓"

-- Style of forward direction indicator in Sort & filter panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.forward.style = nil

-- The shape of the reverse direction indicator for sort identifiers in Sort & filter panel.
--
-- Type: nullable string
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.format = "↑"

-- Style of reverse direction indicator in Sort & filter panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.sort_direction_identifiers.reverse.style = nil

-- The identifiers used to denote applied sorters in the Sort & filter panel.
--
-- Type: nullable mapping of the following key-value pairs:
--
-- * key: [Sorter](https://xplr.dev/en/sorting#sorter)
-- * value:
--   * format: nullable string
--   * style: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.sorter_identifiers = {
  ByExtension = { format = "ext", style = {} },
  ByICanonicalAbsolutePath = { format = "[ci]abs", style = {} },
  ByIRelativePath = { format = "[i]rel", style = {} },
  ByISymlinkAbsolutePath = { format = "[si]abs", style = {} },
  ByIsBroken = { format = "⨯", style = {} },
  ByIsDir = { format = "dir", style = {} },
  ByIsFile = { format = "file", style = {} },
  ByIsReadonly = { format = "ro", style = {} },
  ByIsSymlink = { format = "sym", style = {} },
  ByMimeEssence = { format = "mime", style = {} },
  ByRelativePath = { format = "rel", style = {} },
  BySize = { format = "size", style = {} },
  ByCreated = { format = "created", style = {} },
  ByLastModified = { format = "modified", style = {} },
  ByCanonicalAbsolutePath = { format = "[c]abs", style = {} },
  ByCanonicalExtension = { format = "[c]ext", style = {} },
  ByCanonicalIsDir = { format = "[c]dir", style = {} },
  ByCanonicalIsFile = { format = "[c]file", style = {} },
  ByCanonicalIsReadonly = { format = "[c]ro", style = {} },
  ByCanonicalMimeEssence = { format = "[c]mime", style = {} },
  ByCanonicalSize = { format = "[c]size", style = {} },
  ByCanonicalCreated = { format = "[c]created", style = {} },
  ByCanonicalLastModified = { format = "[c]modified", style = {} },
  BySymlinkAbsolutePath = { format = "[s]abs", style = {} },
  BySymlinkExtension = { format = "[s]ext", style = {} },
  BySymlinkIsDir = { format = "[s]dir", style = {} },
  BySymlinkIsFile = { format = "[s]file", style = {} },
  BySymlinkIsReadonly = { format = "[s]ro", style = {} },
  BySymlinkMimeEssence = { format = "[s]mime", style = {} },
  BySymlinkSize = { format = "[s]size", style = {} },
  BySymlinkCreated = { format = "[s]created", style = {} },
  BySymlinkLastModified = { format = "[s]modified", style = {} },
}

-- The identifiers used to denote applied filters in the Sort & filter panel.
--
-- Type: nullable mapping of the following key-value pairs:
--
-- * key: [Filter](https://xplr.dev/en/filtering#filter)
-- * value:
--   * format: nullable string
--   * style: [Style](https://xplr.dev/en/style)
xplr.config.general.sort_and_filter_ui.filter_identifiers = {
  RelativePathDoesContain = { format = "rel=~", style = {} },
  RelativePathDoesEndWith = { format = "rel=$", style = {} },
  RelativePathDoesNotContain = { format = "rel!~", style = {} },
  RelativePathDoesNotEndWith = { format = "rel!$", style = {} },
  RelativePathDoesNotStartWith = { format = "rel!^", style = {} },
  RelativePathDoesStartWith = { format = "rel=^", style = {} },
  RelativePathIs = { format = "rel==", style = {} },
  RelativePathIsNot = { format = "rel!=", style = {} },
  RelativePathDoesMatchRegex = { format = "rel=/", style = {} },
  RelativePathDoesNotMatchRegex = { format = "rel!/", style = {} },

  IRelativePathDoesContain = { format = "[i]rel=~", style = {} },
  IRelativePathDoesEndWith = { format = "[i]rel=$", style = {} },
  IRelativePathDoesNotContain = { format = "[i]rel!~", style = {} },
  IRelativePathDoesNotEndWith = { format = "[i]rel!$", style = {} },
  IRelativePathDoesNotStartWith = { format = "[i]rel!^", style = {} },
  IRelativePathDoesStartWith = { format = "[i]rel=^", style = {} },
  IRelativePathIs = { format = "[i]rel==", style = {} },
  IRelativePathIsNot = { format = "[i]rel!=", style = {} },
  IRelativePathDoesMatchRegex = { format = "[i]rel=/", style = {} },
  IRelativePathDoesNotMatchRegex = { format = "[i]rel!/", style = {} },

  AbsolutePathDoesContain = { format = "abs=~", style = {} },
  AbsolutePathDoesEndWith = { format = "abs=$", style = {} },
  AbsolutePathDoesNotContain = { format = "abs!~", style = {} },
  AbsolutePathDoesNotEndWith = { format = "abs!$", style = {} },
  AbsolutePathDoesNotStartWith = { format = "abs!^", style = {} },
  AbsolutePathDoesStartWith = { format = "abs=^", style = {} },
  AbsolutePathIs = { format = "abs==", style = {} },
  AbsolutePathIsNot = { format = "abs!=", style = {} },
  AbsolutePathDoesMatchRegex = { format = "abs=/", style = {} },
  AbsolutePathDoesNotMatchRegex = { format = "abs!/", style = {} },

  IAbsolutePathDoesContain = { format = "[i]abs=~", style = {} },
  IAbsolutePathDoesEndWith = { format = "[i]abs=$", style = {} },
  IAbsolutePathDoesNotContain = { format = "[i]abs!~", style = {} },
  IAbsolutePathDoesNotEndWith = { format = "[i]abs!$", style = {} },
  IAbsolutePathDoesNotStartWith = { format = "[i]abs!^", style = {} },
  IAbsolutePathDoesStartWith = { format = "[i]abs=^", style = {} },
  IAbsolutePathIs = { format = "[i]abs==", style = {} },
  IAbsolutePathIsNot = { format = "[i]abs!=", style = {} },
  IAbsolutePathDoesMatchRegex = { format = "[i]abs=/", style = {} },
  IAbsolutePathDoesNotMatchRegex = { format = "[i]abs!/", style = {} },
}

-- The content for panel title by default.
--
-- Type: nullable string
xplr.config.general.panel_ui.default.title.format = nil

-- The style for panel title by default.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.default.title.style = {
  fg = "Reset",
  add_modifiers = { "Bold" },
}

-- Style of the panels by default.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.default.style = {}

-- Defines where to show borders for the panels by default.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.default.borders = {
  "Top",
  "Right",
  "Bottom",
  "Left",
}

-- Type of the borders by default.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.default.border_type = "Rounded"

-- Style of the panel borders by default.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.default.border_style = { fg = "DarkGray" }

-- The content for the table panel title.
--
-- Type: nullable string
xplr.config.general.panel_ui.table.title.format = nil

-- Style of the table panel title.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.table.title.style = {}

-- Style of the table panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.table.style = {}

-- Defines where to show borders for the table panel.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.table.borders = nil

-- Type of the borders for table panel.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.table.border_type = nil

-- Style of the table panel borders.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.table.border_style = {}

-- The content for the help menu panel title.
--
-- Type: nullable string
xplr.config.general.panel_ui.help_menu.title.format = nil

-- Style of the help menu panel title.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.help_menu.title.style = {}

-- Style of the help menu panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.help_menu.style = {}

-- Defines where to show borders for the help menu panel.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.help_menu.borders = nil

-- Type of the borders for help menu panel.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.help_menu.border_type = nil

-- Style of the help menu panel borders.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.help_menu.border_style = {}

-- The content for the input & logs panel title.
--
-- Type: nullable string
xplr.config.general.panel_ui.input_and_logs.title.format = nil

-- Style of the input & logs panel title.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.input_and_logs.title.style = {}

-- Style of the input & logs panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.input_and_logs.style = {}
-- Defines where to show borders for the input & logs panel.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.input_and_logs.borders = nil

-- Type of the borders for input & logs panel.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.input_and_logs.border_type = nil

-- Style of the input & logs panel borders.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.input_and_logs.border_style = {}

-- The content for the selection panel title.
--
-- Type: nullable string
xplr.config.general.panel_ui.selection.title.format = nil

-- Style of the selection panel title.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.selection.title.style = {}

-- Style of the selection panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.selection.style = {}
-- Defines where to show borders for the selection panel.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.selection.borders = nil

-- Type of the borders for selection panel.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.selection.border_type = nil

-- Style of the selection panel borders.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.selection.border_style = {}

-- The content for the sort & filter panel title.
--
-- Type: nullable string
xplr.config.general.panel_ui.sort_and_filter.title.format = nil

-- Style of the sort & filter panel title.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.sort_and_filter.title.style = {}

-- Style of the sort & filter panel.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.sort_and_filter.style = {}

-- Defines where to show borders for the sort & filter panel.
--
-- Type: nullable list of [Border](https://xplr.dev/en/borders#border)
xplr.config.general.panel_ui.sort_and_filter.borders = nil

-- Type of the borders for sort & filter panel.
--
-- Type: nullable [Border Type](https://xplr.dev/en/borders#border-type)
xplr.config.general.panel_ui.sort_and_filter.border_type = nil

-- Style of the sort & filter panel borders.
--
-- Type: [Style](https://xplr.dev/en/style)
xplr.config.general.panel_ui.sort_and_filter.border_style = {}

-- Initial group if sorters applied to the nodes list in the table.
--
-- Type: nullable list of [Node Sorter](https://xplr.dev/en/sorting#node-sorter-applicable)
xplr.config.general.initial_sorting = {
  { sorter = "ByCanonicalIsDir", reverse = true },
  { sorter = "ByIRelativePath", reverse = false },
}

-- The name of one of the modes to use when xplr loads.
--
-- Type: nullable string
xplr.config.general.initial_mode = "default"

-- The name of one of the layouts to use when xplr loads.
--
-- Type: nullable string
xplr.config.general.initial_layout = "default"

-- Set it to a file path to start fifo when xplr loads.
-- Generally it is used to integrate with external tools like previewers.
--
-- Type: nullable string
xplr.config.general.start_fifo = nil

-- Use it to define a set of key bindings that are available by default in
-- every [mode](https://xplr.dev/en/mode). They can be overwritten.
--
-- Type: [Key Bindings](https://xplr.dev/en/configure-key-bindings#key-bindings)
xplr.config.general.global_key_bindings = {
  on_key = {
    esc = {
      messages = {
        "PopMode",
      },
    },
    ["ctrl-c"] = {
      messages = {
        "Terminate",
      },
    },
  },
}
