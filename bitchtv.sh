#!/bin/sh
set -eu

HOST="house"
BITRATE="2000K"
FRAMERATE="30"
STREAM="$(youtube-dl -g "$1")"

ssh "$HOST" "ffmpeg -i '$STREAM' -c:v libx265 -b:v $BITRATE -r $FRAMERATE -preset superfast -c:a copy -f mpegts -" | mpv --quiet --cache-initial=1 -
