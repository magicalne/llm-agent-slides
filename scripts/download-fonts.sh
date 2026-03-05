#!/bin/bash
# Download Google Fonts for self-hosting using proper GitHub raw URLs

FONT_DIR="$(dirname "$0")/../fonts"

mkdir -p "$FONT_DIR"
cd "$FONT_DIR"

echo "Downloading fonts to $FONT_DIR..."

# Urbanist - using jsDelivr CDN (reliable for GitHub files)
echo "Downloading Urbanist..."
curl -L -o urbanist-300.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-300-normal.woff2"
curl -L -o urbanist-400.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-400-normal.woff2"
curl -L -o urbanist-500.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-500-normal.woff2"
curl -L -o urbanist-600.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-600-normal.woff2"
curl -L -o urbanist-700.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-700-normal.woff2"
curl -L -o urbanist-800.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/urbanist@5.1.1/files/urbanist-latin-800-normal.woff2"

# IBM Plex Sans - using jsDelivr CDN
echo "Downloading IBM Plex Sans..."
curl -L -o ibm-plex-sans-300.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/ibm-plex-sans@5.1.1/files/ibm-plex-sans-latin-300-normal.woff2"
curl -L -o ibm-plex-sans-400.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/ibm-plex-sans@5.1.1/files/ibm-plex-sans-latin-400-normal.woff2"
curl -L -o ibm-plex-sans-500.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/ibm-plex-sans@5.1.1/files/ibm-plex-sans-latin-500-normal.woff2"
curl -L -o ibm-plex-sans-600.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/ibm-plex-sans@5.1.1/files/ibm-plex-sans-latin-600-normal.woff2"

# JetBrains Mono - using jsDelivr CDN
echo "Downloading JetBrains Mono..."
curl -L -o jetbrains-mono-400.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/jetbrains-mono@5.1.1/files/jetbrains-mono-latin-400-normal.woff2"
curl -L -o jetbrains-mono-500.woff2 "https://cdn.jsdelivr.net/npm/@fontsource/jetbrains-mono@5.1.1/files/jetbrains-mono-latin-500-normal.woff2"

echo ""
echo "Done! Fonts downloaded to $FONT_DIR"
echo "File sizes:"
ls -lh "$FONT_DIR"/*.woff2
