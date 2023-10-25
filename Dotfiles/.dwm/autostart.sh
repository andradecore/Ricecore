#!/bin/bash
dunst &
clipmenud &

dte(){
	dte="$(date +"󰸗 %d/%m/%Y   󰥔 %H:%M")"
	echo -e "$dte"
}

upd(){
	upd=$(xbps-install -Mun 2> /dev/null | wc -l)
	echo -e "󱑢 $upd"
}

while true; do
	xsetroot -name " $(upd)   $(dte)"
	sleep 10s
done &
