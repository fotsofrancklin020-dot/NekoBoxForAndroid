
#!/bin/bash

set -euo pipefail

DIR="app/src/main/assets/sing-box"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

echo "Downloading GeoIP database..."
curl -fL --retry 3 \
  -o geoip.db \
  https://github.com/SagerNet/sing-geoip/releases/latest/download/geoip.db

echo "Downloading GeoSite database..."
curl -fL --retry 3 \
  -o geosite.db \
  https://github.com/SagerNet/sing-geosite/releases/latest/download/geosite.db

echo "Compressing databases..."
xz -9 geoip.db
xz -9 geosite.db

echo "GeoIP and GeoSite downloaded successfully."
