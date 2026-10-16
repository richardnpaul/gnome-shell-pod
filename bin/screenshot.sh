#!/usr/bin/env bash

# --------------------------------------------------------------------------------- #
# This script captures a screenshot of the running GNOME Shell headless session via #
# the org.gnome.Shell.Screenshot D-Bus API.                                         #
#                                                                                   #
# Usage: screenshot.sh [output_path.png]                                            #
# --------------------------------------------------------------------------------- #

set -o errexit
set -o nounset

OUTPUT="${1:-/home/gnomeshell/capture.png}"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  XDG_RUNTIME_DIR="/run/user/$(id -u)"
  export XDG_RUNTIME_DIR
fi
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"
fi

gdbus call --session \
    --dest org.gnome.Shell \
    --object-path /org/gnome/Shell/Screenshot \
    --method org.gnome.Shell.Screenshot.Screenshot false false "$OUTPUT" >/dev/null

printf '%s\n' "$OUTPUT"
