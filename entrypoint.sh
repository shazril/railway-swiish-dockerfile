#!/bin/sh
set -e

SOURCE_DIR="/app-backup"
TARGET_DIR="/app"

echo "Checking Swiish persistent volume status at $TARGET_DIR..."

# Check if the volume is blank (missing core files)
if [ ! -f "$TARGET_DIR/package.json" ]; then
    echo "Volume is uninitialized. Copying pre-baked Swiish files into volume..."
    # Copy all application files and hidden dotfiles/node_modules
    cp -a "$SOURCE_DIR/." "$TARGET_DIR/"
    echo "File copy complete."
else
    echo "Persistent volume already initialized. Skipping file sync."
fi

# Hand execution back to Swiish's original startup command
# Swiish runs "npm start" or "node dist/main.js" depending on its release setup
exec npm run serve