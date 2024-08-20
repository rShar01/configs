#!/usr/bin/env sh

NET_WIFI=􀙇         # Wi-Fi connected
NET_OFF=􀙈          # Network disconnected, Wi-Fi turned off

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

services=$(networksetup -listnetworkserviceorder)
device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")

test -n "$device" && service=$(echo "$services" \
    | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")


case $service in
    Wi-Fi) # connected to WIFI
        name=$(networksetup -getairportnetwork "$device" | \
            sed 's/^[^:]*: //')
        icon=$NET_WIFI
        speeds=($(ifstat -i $device | awk 'NR==3 {print $1,$2}'))
        up=$(speed_with_unit ${speeds[2]})
        down=$(speed_with_unit ${speeds[1]})
        # label="$icon $name 󱖗$up 󱖙$down"
        label="ryan test"
        echo $up
        echo $down
        sketchybar --set $NAME update_freq=3 icon=$icon label.drawing=on label="$label";;
    *) # not connected to WIFI
        name=":("
        icon=$NET_OFF
        sketchybar --set $NAME update_freq=0 icon=$icon label.drawing=off;;
esac

label="Ryan test"
sketchybar --set $NAME update_freq=3 icon="$NET_WIFI" label.drawing=on label="$label";;
