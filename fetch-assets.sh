#!/bin/bash
# Downloads the images and PDFs from the old site into this repo.
# Run once from the repo root:  bash fetch-assets.sh
set -e
BASE="https://www.immaculateprepja.com/wp-content/uploads"

IMAGES=(
  "2026/07/icps-logo.png"
  "cropped-icps-logo-270x270.jpeg"
  "2026/09/mrs-grant.jpg"
  "2026/09/icps-ph-student-photo.jpg"
  "2026/08/icps-ph-academics-43282.jpg"
  "2026/08/icps-ph-sports-day-a2cd3.jpg"
  "2026/08/icps-ph-faith-life-93605.jpg"
)
DOCS=(
  "2026/09/ICPS_School_Calendar_2026-2027_Term_1_Portrait.pdf"
  "2026/09/2026-Term-1-calendar.pdf"
)

mkdir -p assets/img assets/docs
for f in "${IMAGES[@]}"; do
  echo "Image: $f"; curl -fsSL "$BASE/$f" -o "assets/img/$(basename "$f")"
done
for f in "${DOCS[@]}"; do
  echo "PDF:   $f"; curl -fsSL "$BASE/$f" -o "assets/docs/$(basename "$f")"
done
echo "Done. Check assets/img and assets/docs."
