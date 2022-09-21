---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

-- xpm, xplr plugin manager
package.path = package.path.. ";"  ..
  xpm_path .. "/?.lua;" ..
  xpm_path .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    { name = 'dtomvan/xpm.xplr' },

    { name = 'prncss-xyz/icons.xplr' },
    { name = 'dtomvan/extra-icons.xplr',
      after = function()
          xplr.config.general.table.row.cols[2] = { format = "custom.icons_dtomvan_col_1" }
      end
    },
    { name = 'sayanarijit/command-mode.xplr' },
    { name = 'sayanarijit/dual-pane.xplr' },
    { name = 'sayanarijit/find.xplr' },
    { name = 'sayanarijit/fzf.xplr' },
    { name = 'sayanarijit/map.xplr' },
    { name = 'sayanarijit/trash-cli.xplr' },
    { name = 'sayanarijit/zoxide.xplr' },
    { name = 'Junker/nuke.xplr' },
  },
  auto_install = true,
  auto_cleanup = true,
})

-- Plugins
require("icons").setup()
require("fzf").setup({
  -- Press `ctrl-f` to spawn fzf in $PWD
  mode = "default",
  key = "ctrl-f",
  args = "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
})
require("trash-cli").setup({
  -- Type `dd` to trash, `dr` to restore.
  trash_mode = "delete",
  trash_key = "d",
  restore_mode = "delete",
  restore_key = "r",
  trash_list_selector = "fzf -m | cut -d' ' -f3-"
})
require("zoxide").setup({
  -- Type `Z` to spawn zoxide prompt.
  mode = "default",
  key = "Z",
})
require("dual-pane").setup({
  -- Press ctrl-w and then h / ctrl-h or left / ctrl-left to activate the left pane.
  -- Press ctrl-w and then l / ctrl-l or right / ctrl-right to activate the right pane.
  -- Press ctrl-w and then w / ctrl-w to toggle active pane.
  -- Press ctrl-w and then q / ctrl-q to quit active pane.
  active_pane_width = { Percentage = 70 },
  inactive_pane_width = { Percentage = 30 },
})

-- Visually inspect and interactively execute batch commands
require("map").setup({
  -- Type `M` to switch to single map mode.
  -- Then press `tab` to switch between single and multi map modes.
  -- Press `ctrl-o` to edit the command using your editor.
  mode = "default",  -- or `xplr.config.modes.builtin.default`,
  key = "M",
  editor = os.getenv("EDITOR") or "nvim",
  editor_key = "ctrl-o",
  prefer_multi_map = false,
  placeholder = "{}",
  custom_placeholders = {
    ["{ext}"] = function(node)
      -- See https://xplr.dev/en/lua-function-calls#node
      return node.extension
    end,

    ["{name}"] = require("map").placeholders["{name}"]
  },
})
-- An interactive finder plugin to complement map.xplr.
require("find").setup({
  mode = "default",
  key = "F",
  templates = {
    ["find all"] = {
      key = "a",
      find_command = "fd",
      find_args = "-c=always -H  .",
      cursor_position = 13,
    },
    ["find files"] = {
      key = "f",
      find_command = "fd",
      find_args = "-c=always -H -t=f  .",
      cursor_position = 18,
    },
    ["find directories"] = {
      key = "d",
      find_command = "fd",
      find_args = "-c=always -H -t=d  .",
      cursor_position = 18,
    },
  },
  refresh_screen_key = "ctrl-r",
})

-- This plugin acts like a library to help you define custom commands to perform actions.
-- Type `:` to enter command mode
require("command-mode").setup({
  mode = "default",
  key = ":",
  remap_action_mode_to = {
    mode = "default",
    key = ";",
  }
})

-- View and open files in apps by file type or mime.
require("nuke").setup({
  pager = "more", -- default: less -R
  open = {
    run_executables = true, -- default: false
    custom = {
      {extension = "jpg", command = "viu {}"},
      {mime = "video/mp4", command = "vlc {}"},
      {mime_regex = "^video/.*", command = "smplayer {}"},
      {mime_regex = ".*", command = "xdg-open {}"},
    }
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    }
  },
})

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.v = {
  help = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o
