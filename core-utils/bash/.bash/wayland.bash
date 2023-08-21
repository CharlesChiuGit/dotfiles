#!/usr/bin/env bash

# NOTE: For void linux: xbps-install -S qt5-wayland kwayland
export QT_QPA_PLATFORM=wayland-egl # Qt5-based app
export ELM_DISPLAY=wl              # EFI-based apps
export SDL_VIDEODRIVER=wayland     # SDL-based apps
export MOZ_ENABLE_WAYLAND=1        # Firefox wayland backend

## XWayland
# NOTE: For void linux: xbps-install -S xorg-server-xwayland

xdg_runtime=/run/user/$(id -u)
export XDG_RUNTIME_DIR=${xdg_runtime}
export XDG_SESSION_TYPE=wayland
