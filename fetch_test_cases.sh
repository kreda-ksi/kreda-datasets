#!/bin/bash

SETTINGS="bestvideo[ext=mp4]+bestaudio[ext=m4a]/best"
VIDEO_URL="https://www.youtube.com/watch?v=FYkRCafLCiQ"
CLIP_DIR="clips"

mkdir -p "$CLIP_DIR"

if ! command -v yt-dlp &> /dev/null; then
  echo "yt-dlp is required to grab YT clips but it isn't installed."
  echo "Install it using your package manager."
  exit 1
fi

if ! command -v ffmpeg &> /dev/null; then
  echo "ffmpeg is required to slice YT streams but it isn't installed."
  echo "Install it using your package manager."
  exit 1
fi

yt-dlp -f "$SETTINGS" --download-sections "*00:04:00-00:04:45" -o "$CLIP_DIR/01.mp4" "$VIDEO_URL"
yt-dlp -f "$SETTINGS" --download-sections "*00:05:00-00:05:45" -o "$CLIP_DIR/02.mp4" "$VIDEO_URL"
yt-dlp -f "$SETTINGS" --download-sections "*00:22:00-00:22:45" -o "$CLIP_DIR/03.mp4" "$VIDEO_URL"
yt-dlp -f "$SETTINGS" --download-sections "*00:36:00-00:36:45" -o "$CLIP_DIR/04.mp4" "$VIDEO_URL"
yt-dlp -f "$SETTINGS" --download-sections "*00:41:00-00:41:45" -o "$CLIP_DIR/05.mp4" "$VIDEO_URL"
yt-dlp -f "$SETTINGS" --download-sections "*00:00:00-00:30:00" -o "$CLIP_DIR/06.mp4" "$VIDEO_URL"

echo "All clips downloaded to '$CLIP_DIR/' directory."
