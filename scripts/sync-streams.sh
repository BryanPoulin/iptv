#!/usr/bin/env bash
set -e
set -x

cd "$(dirname "$0")/.."

# Fetch updates from iptv-org
git fetch iptv-org

# Overwrite the local streams/ folder with upstream's streams/
git checkout iptv-org/master -- streams/

# Stage the changes
git add streams/

# Commit if there are changes, otherwise just print a message
git commit -m "Sync streams folder with iptv-org" || echo "No changes to commit"

# Note: index.m3u is handled in the workflow YAML file, not here.
