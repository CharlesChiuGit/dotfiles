---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- ### Modes ------------------------------------------------------------------
--
-- xplr is a modal file explorer. That means the users switch between different
-- modes, each containing a different set of key bindings to avoid clashes.
-- Users can switch between these modes at run-time.
--
-- The modes can be configured using the `xplr.config.modes` Lua API.
--
-- `xplr.config.modes.builtin` contain some built-in modes which can be
-- overridden, but you can't add or remove modes in it.

-- The builtin default mode.
-- Visit the [Default Key Bindings](https://xplr.dev/en/default-key-bindings)
-- to see what each mode does.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.default = {
  name = "default",
  key_bindings = {
    on_key = {
      ["#"] = {
        messages = {
          "PrintAppStateAndQuit",
        },
      },
      ["."] = {
        help = "show hidden",
        messages = {
          {
            ToggleNodeFilter = {
              filter = "RelativePathDoesNotStartWith",
              input = ".",
            },
          },
          "ExplorePwdAsync",
        },
      },
      [":"] = {
        help = "action",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "action" },
        },
      },
      ["?"] = {
        help = "global help menu",
        messages = {
          {
            BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_GLOBAL_HELP_MENU_OUT}" | ${PAGER:?}
            ]===],
          },
        },
      },
      ["G"] = {
        help = "go to bottom",
        messages = {
          "PopMode",
          "FocusLast",
        },
      },
      ["ctrl-a"] = {
        help = "select/unselect all",
        messages = {
          "ToggleSelectAll",
        },
      },
      ["ctrl-f"] = {
        help = "search",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "search" },
          { SetInputBuffer = "(?i)" },
          "ExplorePwdAsync",
        },
      },
      ["ctrl-i"] = {
        help = "next visited path",
        messages = {
          "NextVisitedPath",
        },
      },
      ["ctrl-o"] = {
        help = "last visited path",
        messages = {
          "LastVisitedPath",
        },
      },
      ["ctrl-r"] = {
        help = "refresh screen",
        messages = {
          "ClearScreen",
        },
      },
      ["ctrl-u"] = {
        help = "clear selection",
        messages = {
          "ClearSelection",
        },
      },
      ["ctrl-w"] = {
        help = "switch layout",
        messages = {
          { SwitchModeBuiltin = "switch_layout" },
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "delete" },
        },
      },
      down = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      enter = {
        help = "quit with result",
        messages = {
          "PrintResultAndQuit",
        },
      },
      ["f"] = {
        help = "filter",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "filter" },
        },
      },
      ["g"] = {
        help = "go to",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to" },
        },
      },
      left = {
        help = "back",
        messages = {
          "Back",
        },
      },
      ["q"] = {
        help = "quit",
        messages = {
          "Quit",
        },
      },
      ["r"] = {
        help = "rename",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "rename" },
          {
            BashExecSilently = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              echo SetInputBuffer: "'"${NAME:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
            ]===],
          },
        },
      },
      ["ctrl-d"] = {
        help = "duplicate as",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "duplicate_as" },
          {
            BashExecSilently = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              echo SetInputBuffer: "'"${NAME:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
            ]===],
          },
        },
      },
      right = {
        help = "enter",
        messages = {
          "Enter",
        },
      },
      ["s"] = {
        help = "sort",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "sort" },
        },
      },
      space = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      up = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
      ["~"] = {
        help = "go home",
        messages = {
          {
            BashExecSilently = [===[
              echo ChangeDirectory: "'"${HOME:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
            ]===],
          },
        },
      },
    },
    on_number = {
      help = "input",
      messages = {
        "PopMode",
        { SwitchModeBuiltin = "number" },
        "BufferInputFromKey",
      },
    },
  },
}

xplr.config.modes.builtin.default.key_bindings.on_key["tab"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-i"]

xplr.config.modes.builtin.default.key_bindings.on_key["v"] =
  xplr.config.modes.builtin.default.key_bindings.on_key.space

xplr.config.modes.builtin.default.key_bindings.on_key["V"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-a"]

xplr.config.modes.builtin.default.key_bindings.on_key["/"] =
  xplr.config.modes.builtin.default.key_bindings.on_key["ctrl-f"]

xplr.config.modes.builtin.default.key_bindings.on_key["h"] =
  xplr.config.modes.builtin.default.key_bindings.on_key.left

xplr.config.modes.builtin.default.key_bindings.on_key["j"] =
  xplr.config.modes.builtin.default.key_bindings.on_key.down

xplr.config.modes.builtin.default.key_bindings.on_key["k"] =
  xplr.config.modes.builtin.default.key_bindings.on_key.up

xplr.config.modes.builtin.default.key_bindings.on_key["l"] =
  xplr.config.modes.builtin.default.key_bindings.on_key.right

-- The builtin debug error mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.debug_error = {
  name = "debug error",
  layout = {
    Vertical = {
      config = {
        constraints = {
          { Min = 14 },
          { MinLessThanScreenHeight = 14 },
        },
      },
      splits = {
        {
          CustomContent = {
            title = "debug error",
            body = {
              StaticParagraph = {
                render = [[
  Some errors occurred during startup.
  If you think this is a bug, please report it at:
  https://github.com/sayanarijit/xplr/issues/new
  Press `enter` to open the logs in your $EDITOR.
  Press `escape` to ignore the errors and continue with the default config.
  To disable this mode, set `xplr.config.general.disable_debug_error_mode`
  to `true` in your config file.
                ]],
              },
            },
          },
        },
        "InputAndLogs",
      },
    },
  },
  key_bindings = {
    on_key = {
      enter = {
        help = "open logs in editor",
        messages = {
          {
            BashExec = [===[
              ${EDITOR:-vi} "${XPLR_PIPE_LOGS_OUT:?}"
            ]===],
          },
        },
      },
      q = {
        help = "quit",
        messages = {
          "Quit",
        },
      },
    },
    default = {
      messages = {},
    },
  },
}

-- The builtin recover mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.recover = {
  name = "recover",
  layout = {
    CustomContent = {
      title = " recover ",
      body = {
        StaticParagraph = {
          render = [[
  You pressed an invalid key and went into "recover" mode.
  This mode saves you from performing unwanted actions.
  Let's calm down, press `escape`, and try again.
  To disable this mode, set `xplr.config.general.enable_recover_mode`
  to `false` in your config file.
          ]],
        },
      },
    },
  },
  key_bindings = {
    default = {
      messages = {},
    },
  },
}

-- The builtin go to path mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.go_to_path = {
  name = "go to path",
  key_bindings = {
    on_key = {
      enter = {
        help = "submit",
        messages = {
          {
            BashExecSilently = [===[
              if [ -d "$XPLR_INPUT_BUFFER" ]; then
                echo ChangeDirectory: "'"$XPLR_INPUT_BUFFER"'" >> "${XPLR_PIPE_MSG_IN:?}"
              elif [ -e "$XPLR_INPUT_BUFFER" ]; then
                echo FocusPath: "'"$XPLR_INPUT_BUFFER"'" >> "${XPLR_PIPE_MSG_IN:?}"
              fi
            ]===],
          },
          "PopMode",
        },
      },
      tab = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin selection ops mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.selection_ops = {
  name = "selection ops",
  key_bindings = {
    on_key = {
      ["c"] = {
        help = "copy here",
        messages = {
          {
            BashExec = [===[
              (while IFS= read -r line; do
              if cp -vr -- "${line:?}" ./; then
                echo LogSuccess: $line copied to $PWD >> "${XPLR_PIPE_MSG_IN:?}"
              else
                echo LogError: Failed to copy $line to $PWD >> "${XPLR_PIPE_MSG_IN:?}"
              fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
              echo ClearSelection >> "${XPLR_PIPE_MSG_IN:?}"
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["m"] = {
        help = "move here",
        messages = {
          {
            BashExec = [===[
              (while IFS= read -r line; do
              if mv -v -- "${line:?}" ./; then
                echo LogSuccess: $line moved to $PWD >> "${XPLR_PIPE_MSG_IN:?}"
              else
                echo LogError: Failed to move $line to $PWD >> "${XPLR_PIPE_MSG_IN:?}"
              fi
              done < "${XPLR_PIPE_SELECTION_OUT:?}")
              echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["x"] = {
        help = "open in gui",
        messages = {
          {
            BashExecSilently = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                  elif command -v open; then
                  OPENER=open
                else
                  echo 'LogError: $OPENER not found' >> "${XPLR_PIPE_MSG_IN:?}"
                  exit 1
                fi
              fi
              (while IFS= read -r line; do
              $OPENER "${line:?}" > /dev/null 2>&1
              done < "${XPLR_PIPE_RESULT_OUT:?}")
            ]===],
          },
          "ClearScreen",
          "PopMode",
        },
      },
    },
  },
}

-- The builtin create mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create = {
  name = "create",
  key_bindings = {
    on_key = {
      d = {
        help = "create directory",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create_directory" },
          { SetInputBuffer = "" },
        },
      },
      f = {
        help = "create file",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create_file" },
          { SetInputBuffer = "" },
        },
      },
    },
  },
}

-- The builtin create directory mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_directory = {
  name = "create directory",
  prompt = "ð ❯ ",
  key_bindings = {
    on_key = {
      tab = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      enter = {
        help = "submit",
        messages = {
          {
            BashExecSilently = [===[
              PTH="$XPLR_INPUT_BUFFER"
              if [ "${PTH}" ]; then
                mkdir -p -- "${PTH:?}" \
                && echo "SetInputBuffer: ''" >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo ExplorePwd >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo LogSuccess: $PTH created >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo FocusPath: "'"$PTH"'" >> "${XPLR_PIPE_MSG_IN:?}"
              else
                echo PopMode >> "${XPLR_PIPE_MSG_IN:?}"
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin create file mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.create_file = {
  name = "create file",
  prompt = "ƒ ❯ ",
  key_bindings = {
    on_key = {
      tab = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      enter = {
        help = "submit",
        messages = {
          {
            BashExecSilently = [===[
              PTH="$XPLR_INPUT_BUFFER"
              if [ "$PTH" ]; then
                mkdir -p -- "$(dirname $PTH)" \
                && touch -- "$PTH" \
                && echo "SetInputBuffer: ''" >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo LogSuccess: $PTH created >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo ExplorePwd >> "${XPLR_PIPE_MSG_IN:?}" \
                && echo FocusPath: "'"$PTH"'" >> "${XPLR_PIPE_MSG_IN:?}"
              else
                echo PopMode >> "${XPLR_PIPE_MSG_IN:?}"
              fi
            ]===],
          },
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin number mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.number = {
  name = "number",
  prompt = ":",
  key_bindings = {
    on_key = {
      down = {
        help = "to down",
        messages = {
          "FocusNextByRelativeIndexFromInput",
          "PopMode",
        },
      },
      enter = {
        help = "to index",
        messages = {
          "FocusByIndexFromInput",
          "PopMode",
        },
      },
      up = {
        help = "to up",
        messages = {
          "FocusPreviousByRelativeIndexFromInput",
          "PopMode",
        },
      },
    },
    on_navigation = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
    on_number = {
      help = "input",
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

xplr.config.modes.builtin.number.key_bindings.on_key["j"] =
  xplr.config.modes.builtin.number.key_bindings.on_key.down
xplr.config.modes.builtin.number.key_bindings.on_key["k"] =
  xplr.config.modes.builtin.number.key_bindings.on_key.up

-- The builtin go to mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.go_to = {
  name = "go to",
  key_bindings = {
    on_key = {
      f = {
        help = "follow symlink",
        messages = {
          "FollowSymlink",
          "PopMode",
        },
      },
      g = {
        help = "top",
        messages = {
          "FocusFirst",
          "PopMode",
        },
      },
      p = {
        help = "path",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "go_to_path" },
          { SetInputBuffer = "" },
        },
      },
      x = {
        help = "open in gui",
        messages = {
          {
            BashExecSilently = [===[
              if [ -z "$OPENER" ]; then
                if command -v xdg-open; then
                  OPENER=xdg-open
                  elif command -v open; then
                  OPENER=open
                else
                  echo 'LogError: $OPENER not found' >> "${XPLR_PIPE_MSG_IN:?}"
                  exit 1
                fi
              fi
              $OPENER "${XPLR_FOCUS_PATH:?}" > /dev/null 2>&1
            ]===],
          },
          "ClearScreen",
          "PopMode",
        },
      },
    },
  },
}

-- The builtin rename mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.rename = {
  name = "rename",
  key_bindings = {
    on_key = {
      tab = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      enter = {
        help = "submit",
        messages = {
          {
            BashExecSilently = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              TARGET="${XPLR_INPUT_BUFFER:?}"
              if [ -e "${TARGET:?}" ]; then
                echo LogError: $TARGET already exists >> "${XPLR_PIPE_MSG_IN:?}"
              else
                mv -- "${SRC:?}" "${TARGET:?}" \
                  && echo ExplorePwd >> "${XPLR_PIPE_MSG_IN:?}" \
                  && echo FocusPath: "'"$TARGET"'" >> "${XPLR_PIPE_MSG_IN:?}" \
                  && echo LogSuccess: $SRC renamed to $TARGET >> "${XPLR_PIPE_MSG_IN:?}"
              fi
            ]===],
          },
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin duplicate as mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.duplicate_as = {
  name = "duplicate as",
  key_bindings = {
    on_key = {
      tab = {
        help = "try complete",
        messages = {
          { CallLuaSilently = "builtin.try_complete_path" },
        },
      },
      enter = {
        help = "submit",
        messages = {
          {
            BashExecSilently = [===[
              SRC="${XPLR_FOCUS_PATH:?}"
              TARGET="${XPLR_INPUT_BUFFER:?}"
              if [ -e "${TARGET:?}" ]; then
                echo LogError: $TARGET already exists >> "${XPLR_PIPE_MSG_IN:?}"
              else
                cp -r -- "${SRC:?}" "${TARGET:?}" \
                  && echo ExplorePwd >> "${XPLR_PIPE_MSG_IN:?}" \
                  && echo FocusPath: "'"$TARGET"'" >> "${XPLR_PIPE_MSG_IN:?}" \
                  && echo LogSuccess: $SRC duplicated as $TARGET >> "${XPLR_PIPE_MSG_IN:?}"
              fi
            ]===],
          },
          "PopMode",
        },
      },
    },
    default = {
      messages = {
        "UpdateInputBufferFromKey",
      },
    },
  },
}

-- The builtin delete mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.delete = {
  name = "delete",
  key_bindings = {
    on_key = {
      ["D"] = {
        help = "force delete",
        messages = {
          {
            BashExec = [===[
              (while IFS= read -r line; do
              if rm -rfv -- "${line:?}"; then
                echo LogSuccess: $line deleted >> "${XPLR_PIPE_MSG_IN:?}"
              else
                echo LogError: Failed to delete $line >> "${XPLR_PIPE_MSG_IN:?}"
              fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
      ["d"] = {
        help = "delete",
        messages = {
          {
            BashExec = [===[
              (while IFS= read -r line; do
              if [ -d "$line" ] && [ ! -L "$line" ]; then
                if rmdir -v -- "${line:?}"; then
                  echo LogSuccess: $line deleted >> "${XPLR_PIPE_MSG_IN:?}"
                else
                  echo LogError: Failed to delete $line >> "${XPLR_PIPE_MSG_IN:?}"
                fi
              else
                if rm -v -- "${line:?}"; then
                  echo LogSuccess: $line deleted >> "${XPLR_PIPE_MSG_IN:?}"
                else
                  echo LogError: Failed to delete $line >> "${XPLR_PIPE_MSG_IN:?}"
                fi
              fi
              done < "${XPLR_PIPE_RESULT_OUT:?}")
              echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
              read -p "[enter to continue]"
            ]===],
          },
          "PopMode",
        },
      },
    },
  },
}

-- The builtin action mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.action = {
  name = "action to",
  key_bindings = {
    on_key = {
      ["!"] = {
        help = "shell",
        messages = {
          { Call = { command = "bash", args = { "-i" } } },
          "ExplorePwdAsync",
          "PopMode",
        },
      },
      ["c"] = {
        help = "create",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "create" },
        },
      },
      ["e"] = {
        help = "open in editor",
        messages = {
          {
            BashExec = [===[
              ${EDITOR:-vi} "${XPLR_FOCUS_PATH:?}"
            ]===],
          },
          "PopMode",
        },
      },
      ["l"] = {
        help = "logs",
        messages = {
          {
            BashExec = [===[
              [ -z "$PAGER" ] && PAGER="less -+F"
              cat -- "${XPLR_PIPE_LOGS_OUT}" | ${PAGER:?}
            ]===],
          },
          "PopMode",
        },
      },
      ["s"] = {
        help = "selection operations",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "selection_ops" },
        },
      },
      ["m"] = {
        help = "toggle mouse",
        messages = {
          "PopMode",
          "ToggleMouse",
        },
      },
      ["q"] = {
        help = "quit options",
        messages = {
          "PopMode",
          { SwitchModeBuiltin = "quit" },
        },
      },
    },
    on_number = {
      help = "go to index",
      messages = {
        "PopMode",
        { SwitchModeBuiltin = "number" },
        "BufferInputFromKey",
      },
    },
  },
}

-- The builtin quit mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.quit = {
  name = "quit",
  key_bindings = {
    on_key = {
      enter = {
        help = "just quit",
        messages = {
          "Quit",
        },
      },
      p = {
        help = "quit printing pwd",
        messages = {
          "PrintPwdAndQuit",
        },
      },
      f = {
        help = "quit printing focus",
        messages = {
          "PrintFocusPathAndQuit",
        },
      },
      s = {
        help = "quit printing selection",
        messages = {
          "PrintSelectionAndQuit",
        },
      },
      r = {
        help = "quit printing result",
        messages = {
          "PrintResultAndQuit",
        },
      },
    },
  },
}

-- The builtin search mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.search = {
  name = "search",
  prompt = "/",
  key_bindings = {
    on_key = {
      down = {
        help = "down",
        messages = {
          "FocusNext",
        },
      },
      enter = {
        help = "submit",
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
      right = {
        help = "enter",
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "Enter",
          { SetInputBuffer = "(?i)" },
          "ExplorePwdAsync",
        },
      },
      left = {
        help = "back",
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "Back",
          { SetInputBuffer = "(?i)" },
          "ExplorePwdAsync",
        },
      },
      tab = {
        help = "toggle selection",
        messages = {
          "ToggleSelection",
          "FocusNext",
        },
      },
      up = {
        help = "up",
        messages = {
          "FocusPrevious",
        },
      },
    },
    default = {
      messages = {
        { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "UpdateInputBufferFromKey",
        { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "ExplorePwdAsync",
      },
    },
  },
}

xplr.config.modes.builtin.search.key_bindings.on_key["esc"] =
  xplr.config.modes.builtin.search.key_bindings.on_key.enter
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-n"] =
  xplr.config.modes.builtin.search.key_bindings.on_key.down
xplr.config.modes.builtin.search.key_bindings.on_key["ctrl-p"] =
  xplr.config.modes.builtin.search.key_bindings.on_key.up

-- The builtin filter mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.filter = {
  name = "filter",
  key_bindings = {
    on_key = {
      ["r"] = {
        help = "relative path does match regex",
        messages = {
          { SwitchModeBuiltin = "relative_path_does_match_regex" },
          { SetInputBuffer = "" },
          { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "ExplorePwdAsync",
        },
      },
      ["R"] = {
        help = "relative path does not match regex",
        messages = {
          { SwitchModeBuiltin = "relative_path_does_not_match_regex" },
          { SetInputBuffer = "" },
          { AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
          "ExplorePwdAsync",
        },
      },
      backspace = {
        help = "remove last filter",
        messages = {
          "RemoveLastNodeFilter",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "reset filters",
        messages = {
          "ResetNodeFilters",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-u"] = {
        help = "clear filters",
        messages = {
          "ClearNodeFilters",
          "ExplorePwdAsync",
        },
      },
    },
  },
}

-- The builtin relative_path_does_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_match_regex = {
  name = "relative path does match regex",
  prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesMatchRegex.format,
  key_bindings = {
    on_key = {
      enter = {
        help = "submit",
        messages = {
          "PopMode",
        },
      },
      esc = {
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
    },
    default = {
      messages = {
        { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "UpdateInputBufferFromKey",
        { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
        "ExplorePwdAsync",
      },
    },
  },
}

-- The builtin relative_path_does_not_match_regex mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.relative_path_does_not_match_regex = {
  name = "relative path does not match regex",
  prompt = xplr.config.general.sort_and_filter_ui.filter_identifiers.RelativePathDoesNotMatchRegex.format,
  key_bindings = {
    on_key = {
      enter = {
        help = "submit",
        messages = {
          "PopMode",
        },
      },
      esc = {
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
          "PopMode",
          "ExplorePwdAsync",
        },
      },
    },
    default = {
      messages = {
        { RemoveNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
        "UpdateInputBufferFromKey",
        { AddNodeFilterFromInput = "RelativePathDoesNotMatchRegex" },
        "ExplorePwdAsync",
      },
    },
  },
}

-- The builtin sort mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.sort = {
  name = "sort",
  key_bindings = {
    on_key = {
      ["!"] = {
        help = "reverse sorters",
        messages = {
          "ReverseNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["E"] = {
        help = "by canonical extension reverse",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByCanonicalExtension",
              reverse = true,
            },
          },
          "ExplorePwdAsync",
        },
      },
      ["M"] = {
        help = "by canonical mime essence reverse",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByCanonicalMimeEssence",
              reverse = true,
            },
          },
          "ExplorePwdAsync",
        },
      },
      ["N"] = {
        help = "by node type reverse",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByCanonicalIsDir",
              reverse = true,
            },
          },
          {
            AddNodeSorter = {
              sorter = "ByCanonicalIsFile",
              reverse = true,
            },
          },
          {
            AddNodeSorter = {
              sorter = "ByIsSymlink",
              reverse = true,
            },
          },
          "ExplorePwdAsync",
        },
      },
      ["R"] = {
        help = "by relative path reverse",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByIRelativePath",
              reverse = true,
            },
          },
          "ExplorePwdAsync",
        },
      },
      ["S"] = {
        help = "by size reverse",
        messages = {
          {
            AddNodeSorter = {
              sorter = "BySize",
              reverse = true,
            },
          },
          "ExplorePwdAsync",
        },
      },
      backspace = {
        help = "remove last sorter",
        messages = {
          "RemoveLastNodeSorter",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-r"] = {
        help = "reset sorters",
        messages = {
          "ResetNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["ctrl-u"] = {
        help = "clear sorters",
        messages = {
          "ClearNodeSorters",
          "ExplorePwdAsync",
        },
      },
      ["e"] = {
        help = "by canonical extension",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByCanonicalExtension",
              reverse = false,
            },
          },
          "ExplorePwdAsync",
        },
      },
      enter = {
        help = "submit",
        messages = {
          "PopMode",
        },
      },
      ["m"] = {
        help = "by canonical mime essence",
        messages = {
          {
            AddNodeSorter = {
              sorter = "ByCanonicalMimeEssence",
              reverse = false,
            },
          },
          "ExplorePwdAsync",
        },
      },
      ["n"] = {
        help = "by node type",
        messages = {
          {
            AddNodeSorter = { sorter = "ByCanonicalIsDir", reverse = false },
          },
          {
            AddNodeSorter = { sorter = "ByCanonicalIsFile", reverse = false },
          },
          {
            AddNodeSorter = { sorter = "ByIsSymlink", reverse = false },
          },
          "ExplorePwdAsync",
        },
      },
      ["r"] = {
        help = "by relative path",
        messages = {
          { AddNodeSorter = { sorter = "ByIRelativePath", reverse = false } },
          "ExplorePwdAsync",
        },
      },
      ["s"] = {
        help = "by size",
        messages = {
          { AddNodeSorter = { sorter = "BySize", reverse = false } },
          "ExplorePwdAsync",
        },
      },

      ["c"] = {
        help = "by created",
        messages = {
          { AddNodeSorter = { sorter = "ByCreated", reverse = false } },
          "ExplorePwdAsync",
        },
      },

      ["C"] = {
        help = "by created reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByCreated", reverse = true } },
          "ExplorePwdAsync",
        },
      },

      ["l"] = {
        help = "by last modified",
        messages = {
          { AddNodeSorter = { sorter = "ByLastModified", reverse = false } },
          "ExplorePwdAsync",
        },
      },

      ["L"] = {
        help = "by last modified reverse",
        messages = {
          { AddNodeSorter = { sorter = "ByLastModified", reverse = true } },
          "ExplorePwdAsync",
        },
      },
    },
  },
}

-- The builtin switch layout mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.switch_layout = {
  name = "switch layout",
  key_bindings = {
    on_key = {
      ["1"] = {
        help = "default",
        messages = {
          { SwitchLayoutBuiltin = "default" },
          "PopMode",
        },
      },
      ["2"] = {
        help = "no help menu",
        messages = {
          { SwitchLayoutBuiltin = "no_help" },
          "PopMode",
        },
      },
      ["3"] = {
        help = "no selection panel",
        messages = {
          { SwitchLayoutBuiltin = "no_selection" },
          "PopMode",
        },
      },
      ["4"] = {
        help = "no help or selection",
        messages = {
          { SwitchLayoutBuiltin = "no_help_no_selection" },
          "PopMode",
        },
      },
    },
  },
}

-- This is where you define custom modes.
--
-- Type: mapping of the following key-value pairs:
--
-- * key: string
-- * value: [Mode](https://xplr.dev/en/mode)
--
-- Example:
--
-- ```lua
-- xplr.config.modes.custom.example = {
--   name = "example",
--   key_bindings = {
--     on_key = {
--       enter = {
--         help = "default mode",
--         messages = {
--           "PopMode",
--           { SwitchModeBuiltin = "default" },
--         },
--       },
--     },
--   },
-- }
--
-- xplr.config.general.initial_mode = "example"
-- ```
xplr.config.modes.custom = {}
