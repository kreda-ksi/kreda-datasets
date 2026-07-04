#!/bin/bash

RTSP_IP="${1:-localhost}"
RTSP_PORT="${2:-8554}"

RTSP_URL="rtsp://${RTSP_IP}:${RTSP_PORT}/live"

if ! command -v ffplay &> /dev/null; then
  echo "ffplay is required to view the stream but it isn't installed."
  echo "Please install it using your package manager."
  exit 1
fi

ffplay -fflags nobuffer -flags low_delay -rtsp_transport tcp "$RTSP_URL"
