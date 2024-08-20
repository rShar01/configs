#!/usr/bin/env bash

interface=en0
wifi_is_on() {
    networksetup -getairportpower $interface | grep -q "On"
}

speed_with_unit() {
    local speed=$1
    local unit
    if (( speed > 1024*1024 )); then
        speed=$((speed / (1024*1024)))
        unit='G'
    elif (( speed > 1024 )); then
        speed=$((speed / 1024))
        unit='M'
    else
        unit='K'
    fi
    printf "%d %s\n" $speed $unit
}

get_network_name() {
    local name=$(networksetup -getairportnetwork "$interface" | \
        sed 's/^[^:]*: //')
    local max_length=20
    if [ ${#name} -gt $max_length ]; then
        echo "${name:0:$max_length}"
    else
        echo "$name"
    fi
}

output=$(ifstat -i en0 1 1 | tail -n 1)
dwnload=$(echo $output | awk '{printf "%.0f", $1}')
upld=$(echo $output | awk '{printf "%.0f", $2}')

# download_raw=$(ifstat -i en0 1 1 | awk 'NR==3 {print $2 " KB/s"}')
# upload_raw=$(ifstat -i en0 1 1 | awk 'NR==3 {print $1 " KB/s"}')

download=$(speed_with_unit $dwnload)
upload=$(speed_with_unit $upld)

if wifi_is_on; then 
    name=$(get_network_name)
    sketchybar --set "$NAME" update_freq=3 icon="􀙇 " label="$name 󱖙 $download 󱖗 $upload"
else
    sketchybar --set $NAME update_freq=0 icon="􀙈 " label.drawing=off
fi
