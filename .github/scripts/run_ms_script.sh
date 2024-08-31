#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Update endpoints based on the provided list
echo $MOONSHOT_UPDATE_ENDPOINTS_LIST
echo "Updating endpoints..."
IFS=';' read -ra ENDPOINTS <<< "$MOONSHOT_UPDATE_ENDPOINTS_LIST"
for cmd in "${ENDPOINTS[@]}"; do
  echo "Executing: $cmd"
  eval "$cmd"
done

echo "Run completed"