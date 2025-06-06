#!/usr/bin/env bash

# Move to the repo root (assuming this script lives in ./scripts/)
cd "$(dirname "$0")/.."

# Fetch updates from iptv-org
echo "Fetching updates from iptv-org..."
git fetch iptv-org

# Sync all *.m3u files from iptv-org to ./streams/, excluding index.m3u
echo "Checking out all streams/*.m3u files from iptv-org/master..."
git checkout iptv-org/master -- streams/*.m3u || echo "No streams/*.m3u found in remote."

# Make sure index.m3u is not tracked
git rm --cached streams/index.m3u 2>/dev/null || true

# Add and commit any changes to streams/*.m3u
echo "Staging and committing updated streams/*.m3u files..."
git add streams/*.m3u
git commit -m "Sync all streams/*.m3u from iptv-org" || echo "No changes in streams/"

# Generate a combined index.m3u
echo "Generating index.m3u..."
echo "#EXTM3U" > index.m3u

# List of files to include
SELECTED_FILES=(streams/us*.m3u streams/ca.m3u streams/uk.m3u streams/au.m3u)

found=false
for FILE in "${SELECTED_FILES[@]}"; do
  if [ -f "$FILE" ]; then
    found=true
    filename=$(basename "$FILE")
    echo "# --- START of $filename ---" >> index.m3u
    
    # Exclude #EXTM3U and blank lines at start
    grep -v '^#EXTM3U' "$FILE" >> index.m3u
    
    echo "# --- END of $filename ---" >> index.m3u
    echo "" >> index.m3u  # Blank line after END marker
  else
    echo "Warning: $FILE not found!" >&2
  fi
done

if [ "$found" = false ]; then
  echo "⚠️ No matching .m3u files found to combine! index.m3u will have only headers."
fi

# Always stage the generated index.m3u
git add index.m3u
git commit -m "Update index.m3u with group comments" || echo "No changes in index.m3u"

echo "✅ Script complete. index.m3u is formatted as requested."
