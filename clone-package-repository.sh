#!/bin/sh
rm -rf "packages"
mkdir -p "packages"
cd "packages"
echo "Getting GitHub release files..."
urls="$(curl -s https://api.github.com/repos/jonasjaguar/jagudev-pacman-packages/releases/latest | jq -r '.assets[].browser_download_url')"
echo "$urls" | while read line
do
   wget -q --show-progress "$line"
done

echo "==== Done! ===="
