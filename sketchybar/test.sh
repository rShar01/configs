sleep 1

services=$(networksetup -listnetworkserviceorder)
device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")


test -n "$device" && service=$(echo "$services" \
    | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")

ssid=$(networksetup -getairportnetwork "$device" \
    | sed -n "s/Current Wi-Fi Network: \(.*\)/\1/p")


case $service in
    Wi-Fi) # connected to WIFI
        echo "good me";;
    *) # not connected to WIFI
        echo "bad me";;
esac

