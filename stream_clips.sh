#!/bin/bash

if [ "$#" -lt 2 ]; then
  echo "Usage: bash stream_clips.sh <clip_path> <rtsp_ip> [rtsp_port]"
  exit 1
fi

VIDEO_FILE="$1"
RTSP_IP="$2"
RTSP_PORT=${3:-8554}
RTSP_URL="rtsp://${RTSP_IP}:${RTSP_PORT}/live"

if [ ! -f "$VIDEO_FILE" ]; then
  echo "File '$VIDEO_FILE' not found."
  exit 1
fi

echo "Broadcasting '$VIDEO_FILE' to $RTSP_URL"
echo "Ctrl+C to stop the stream."

ffmpeg -re -stream_loop -1 -i "$VIDEO_FILE" -c copy -f rtsp "$RTSP_URL"
