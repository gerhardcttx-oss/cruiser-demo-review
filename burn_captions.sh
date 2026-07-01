#!/usr/bin/env bash
# Burns the story-context English captions (cruiser-story-captions.ass) onto
# cruiser-demo.mp4 and produces an Instagram Reels / TikTok-ready mp4.
#
# Usage: ./burn_captions.sh [input.mp4] [subtitles.ass] [output.mp4]
set -euo pipefail

INPUT="${1:-cruiser-demo.mp4}"
SUBS="${2:-cruiser-story-captions.ass}"
OUTPUT="${3:-cruiser-demo-captioned.mp4}"

if [ ! -f "$INPUT" ]; then
  echo "Input video not found: $INPUT" >&2
  exit 1
fi
if [ ! -f "$SUBS" ]; then
  echo "Subtitle file not found: $SUBS" >&2
  exit 1
fi

# Run from the directory containing the subtitle file so ffmpeg's ass filter
# doesn't choke on Windows drive-letter colons in an absolute path.
cd "$(dirname "$SUBS")"
SUBS_BASENAME="$(basename "$SUBS")"

ffmpeg -y -i "$INPUT" \
  -vf "ass=${SUBS_BASENAME}" \
  -c:v libx264 -preset medium -crf 20 -profile:v high -pix_fmt yuv420p \
  -c:a aac -b:a 128k -ar 48000 \
  -movflags +faststart \
  "$OUTPUT"

echo "Done: $OUTPUT"
