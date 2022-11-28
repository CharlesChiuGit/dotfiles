---@diagnostic disable
local xplr = xplr -- The globally exposed configuration to be overridden.
---@diagnostic enable

-- Fuzzy search the last visited directories.
xplr.config.modes.builtin.go_to.key_bindings.on_key.h = {
  help = "history",
  messages = {
    "PopMode",
    {
      BashExec = [===[
        PTH=$(cat "${XPLR_PIPE_HISTORY_OUT:?}" | sort -u | fzf --no-sort)
        if [ "$PTH" ]; then
          echo ChangeDirectory: "'"${PTH:?}"'" >> "${XPLR_PIPE_MSG_IN:?}"
        fi
      ]===],
    },
  },
}

-- Batch rename the selected or visible files and directories in $PWD.
xplr.config.modes.builtin.default.key_bindings.on_key.R = {
  help = "batch rename",
  messages = {
    {
      BashExec = [===[
       SELECTION=$(cat "${XPLR_PIPE_SELECTION_OUT:?}")
       NODES=${SELECTION:-$(cat "${XPLR_PIPE_DIRECTORY_NODES_OUT:?}")}
       if [ "$NODES" ]; then
         echo -e "$NODES" | renamer
         echo ExplorePwdAsync >> "${XPLR_PIPE_MSG_IN:?}"
       fi
     ]===],
    },
  },
}

-- Preview images using imv.
-- TODO: not working
-- xplr.config.modes.builtin.default.key_bindings.on_key.P = {
--   help = "preview",
--   messages = {
--     {
--       BashExecSilently = [===[
--         FIFO_PATH="/tmp/xplr.fifo"

--         if [ -e "$FIFO_PATH" ]; then
--           echo StopFifo >> "$XPLR_PIPE_MSG_IN"
--           rm -f -- "$FIFO_PATH"
--         else
--           mkfifo "$FIFO_PATH"
--           "$HOME/.config/xplr/imv-open.sh" "$FIFO_PATH" "$XPLR_FOCUS_PATH" &
--           echo "StartFifo: '$FIFO_PATH'" >> "$XPLR_PIPE_MSG_IN"
--         fi
--       ]===],
--     },
--   },
-- }

-- Preview text files in a native xplr pane (should be fast enough).
local function stat(node)
  return node.mime_essence
end

local function read(path, lines)
  local out = ""
  local p = io.open(path)

  if p == nil then
    return stat(path)
  end

  local i = 0
  for line in p:lines() do
    out = out .. line .. "\n"
    if i == lines then
      break
    end
    i = i + 1
  end
  p:close()

  return out
end

-- xplr.config.layouts.builtin.default = {
--   Horizontal = {
--     config = {
--       constraints = {
--         { Percentage = 60 },
--         { Percentage = 40 },
--       },
--     },
--     splits = {
--       "Table",
--       {
--         CustomContent = {
--           title = "Preview",
--           body = { DynamicParagraph = { render = "custom.preview_pane.render" } },
--         },
--       },
--     },
--   },
-- }

xplr.config.layouts.builtin.default = {
  Horizontal = {
    config = {
      constraints = {
        { Percentage = 60 },
        { Percentage = 40 },
      },
    },
    splits = {
      {
        Vertical = {
          config = {
            constraints = {
              -- { Length = 3 },
              { Min = 1 },
              { Length = 12 },
              { Length = 3 },
            },
          },
          splits = {
            -- "SortAndFilter",
            "Table",
            "Selection",
            "InputAndLogs",
          },
        },
      },
      {
        Vertical = {
          config = {
            constraints = {
              { Percentage = 40 },
              { Percentage = 60 },
            },
          },
          splits = {
            {
              CustomContent = {
                title = "⟪Preview⟫",
                body = { DynamicParagraph = { render = "custom.preview_pane.render" } },
              },
            },
            "HelpMenu",
          },
        },
      },
    },
  },
}

xplr.fn.custom.preview_pane = {}
xplr.fn.custom.preview_pane.render = function(ctx)
  local n = ctx.app.focused_node

  if n and n.canonical then
    n = n.canonical
  end

  if n then
    if n.is_file then
      return read(n.absolute_path, ctx.layout_size.height)
    else
      return stat(n)
    end
  else
    return ""
  end
end
