#!/bin/sh

# Use hyprpicker to get the color and copy it to the clipboard
color=$(hyprpicker -a)

# Send a notification with the picked color
notify-send "Color Picked" "Color: $color"
