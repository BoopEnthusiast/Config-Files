#!/bin/bash

# Taken from https://github.com/Alexays/Waybar/issues/961#issuecomment-2661418273

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

while true; do
  waybar &
  inotifywait -e create,modify $CONFIG_FILES
  killall waybar
done
