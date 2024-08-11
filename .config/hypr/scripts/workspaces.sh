#!/bin/sh

file_path="/home/morven/.config/hypr/set/monitor.conf"

json_output=$(hyprctl -j monitors)

count=$(echo "$json_output" | jq 'length')

if [ "$count" -eq 2 ]; then
    content="monitor=HDMI-A-2, 1920x1080, 0x-1080, 1"
    content="$content\nworkspace=HDMI-A-2,1"
    content="$content\nmonitor=desc:Chimei Innolux Corporation 0x14D4, 1920x1080, 0x0, 1"
    content="$content\nworkspace=eDP-1,5"
    content="$content\nworkspace=1,monitor:HDMI-A-2"
    content="$content\nworkspace=2,monitor:HDMI-A-2"
    content="$content\nworkspace=3,monitor:HDMI-A-2"
    content="$content\nworkspace=4,monitor:HDMI-A-2"
    content="$content\nworkspace=5,monitor:eDP-1"
else
    content="monitor=desc:Chimei Innolux Corporation 0x14D4, 1920x1080, 0x0, 1"
    content="$content\nworkspace=eDP-1,1"
    content="$content\nworkspace=1,monitor:eDP-1"
    content="$content\nworkspace=2,monitor:eDP-1"
    content="$content\nworkspace=3,monitor:eDP-1"
    content="$content\nworkspace=4,monitor:eDP-1"
    content="$content\nworkspace=5,monitor:eDP-1"
fi

echo -e "$content" >"$file_path"
