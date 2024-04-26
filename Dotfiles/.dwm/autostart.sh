#!/bin/bash
setxkbmap br thinkpad &
xinput --set-prop 10 333 1 &
#xrdb $HOME/.Xresources
dunst &
clipmenud &
#xsetroot -cursor_name left_ptr &
pipewire &
xwallpaper --zoom ~/Media/Pictures/Wallpapers/Pixel-Night.jpg &
xset r rate 200 50 &

dte(){
	dte="$(date +"󰸗 %d/%m/%Y   󰥔 %H:%M")"
	echo -e "$dte"
}

while true; do
	xsetroot -name " $(dte)"
	sleep 10s
done &
