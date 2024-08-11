#!/usr/bin/env bash
set -euo pipefail

readonly ENABLED='  '
readonly DISABLED='  '
dbus-monitor path='/org/freedesktop/Notifications',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged' --profile |
    while read -r _; do
        PAUSED="$(dunstctl is-paused)"
        if [ "$PAUSED" == 'false' ]; then
            CLASS="enabled"
            TEXT="$ENABLED"
        else
            CLASS="disabled"
            TEXT="$DISABLED"
        fi
        printf '{"text": "%s", "class": "%s", "a": "2"}\n' "$TEXT" "$CLASS"
    done
