#!/bin/bash
sxhkd -c $HOME/.config/dwm-sxhkd/dwm-sxhkdrc &
#dunst &
xwallpaper --zoom ~/Pictures/Wallpapers/Pixel-Night.jpg &
clipmenud &

dte(){
	dte="$(date +"󰸗 %d/%m/%Y    %H:%M")"
	echo -e "$dte"
}

upd(){
	upd=`checkupdates | wc -l`
	echo -e "󱑢 $upd"
}

while true; do
	xsetroot -name " $(upd)   $(dte)"
	sleep 10s
done &
