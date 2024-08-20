#!/usr/bin/env bash

#STATE="$(echo "$INFO" | jq -r '.state')"
#APP="$(echo "$INFO" | jq -r '.app')"

#if [ "$STATE" = "playing" ] && [ "$APP" == "Spotify" ]; then
#	MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
#	sketchybar --set "$NAME" label="$MEDIA" drawing=on
#else
#	sketchybar --set "$NAME" drawing=off
#fi

if pgrep -x "Spotify" > /dev/null; then
    MEDIA=$(osascript -e 'tell application "Spotify" to artist of current track & " - " & name of current track')
	sketchybar --set "$NAME" label="$MEDIA" drawing=on
else
	sketchybar --set "$NAME" drawing=off
fi

