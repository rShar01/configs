#!/usr/bin/env bash

COLOR="$YELLOW"

sketchybar --add item wifi right \
    --set wifi \
    update_freq=3 \
    icon.color="$COLOR" \
    icon.padding_left=10 \
    label.color="$COLOR" \
    label.padding_right=10 \
    background.height=26 \
    background.corner_radius="$CORNER_RADIUS" \
    background.padding_right=5 \
    background.border_width="$BORDER_WIDTH" \
    background.border_color="$COLOR" \
    background.color="$BAR_COLOR" \
    background.drawing=on \
    script="$PLUGIN_DIR/net.sh"

# sketchybar --add item wifi right \
#            --set wifi \
#                  update_freq=5 \
#                  icon.drawing=off \
#                  background.padding_left=-9 \
#                  script=$PLUGIN_DIR/wifi.sh \
#            --subscribe wifi wifi_change \
#            --add alias "Control Center,WiFi" right \
#            --set "Control Center,WiFi" \
#                  alias.color=$COLOR[red] \
#                  alias.update_freq=5 \
#                  icon.drawing=off \
#                  label.drawing=off \
#                  background.padding_left=-4 \
#                  background.padding_right=0 \
