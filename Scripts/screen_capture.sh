#!/bin/bash

# Pick a file name for de video

if [[ -f ~/Videos/Channel/output.mkv ]]
	then
		n=1
		while [[ -f $HOME/Media/Videos/Channel/output_$n.mkv ]]
		do
			n=$((n1))
		done
		filename="$HOME/Media/Videos/Channel/output_$n.mkv"
	else
		filename="$HOME/Media/Videos/Channel/output.mkv"
fi

# ffmpeg command
st -e \
ffmpeg \
-video_size 1920x1080 \
-framerate 30 \
-f x11grab \
-i :0.0 \
-c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 $filename \
| notify-send "ffmpeg" "Now recording..." ; notify-send "ffmpeg" "Stop recording..." 
