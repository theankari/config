#!/bin/bash

rofi_command="rofi -theme themes/mpdmenu.rasi"

### Options ###
# Gets the current status of mpd (for us to parse it later on)
status="$(playerctl status)"
# Defines the Play / Pause option content
if [[ $status == "Playing" ]]; then
    play_pause=""
else
    play_pause=""
fi
active=""
urgent=""
# Display if repeat mode is on / off
tog_repeat="凌"
repeat="$(playerctl loop)"
case $repeat in
	"None")
		active="-u 4"
		;;
	"Track")
		urgent="-a 4"
		;;
	"Playlist")
		urgent="-a 4"
		;;
esac
# Display if random mode is on / off
tog_random=""
if [[ $status == *"random: on"* ]]; then
    [ -n "$active" ] && active+=",5" || active="-a 5"
elif [[ $status == *"random: off"* ]]; then
    [ -n "$urgent" ] && urgent+=",5" || urgent="-u 5"
else
    tog_random=" Parsing error"
fi
stop=""
next=""
previous=""
# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_random"

# Get the current playing song
current=$(mpc current)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "$current" -dmenu $active $urgent -selected-row 1)"
case $chosen in
    $previous)
        playerctl previous
        ;;
    $play_pause)
        playerctl play-pause
        ;;
    $stop)
        playerctl stop
        ;;
    $next)
        playerctl next
        ;;
    $tog_repeat)
        mpc -q repeat
        ;;
    $tog_random)
        playerctl shuffle On
        ;;
esac

