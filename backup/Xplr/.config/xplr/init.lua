version = "0.19.3"

local home = os.getenv("HOME")
package.path = home .. "/.config/xplr/configs/?.lua;" ..
  home .. "/.config/xplr/plugins/?/init.lua"

-- Load configs
require("general")
require("node_types")
require("modes")
require("layouts")
require("functions")
require("hacks")
require("plugins")
