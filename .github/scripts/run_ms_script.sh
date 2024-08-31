#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Function to replace placeholders with actual environment variable values
replace_placeholders() {
  local cmd=$1
  cmd=${cmd//\$\{AZURE_OPENAI_4O_UPDATE_ENDPOINT\}/$AZURE_OPENAI_4O_UPDATE_ENDPOINT}
  echo "$cmd"
}

# Update endpoints based on the provided list
echo "Updating endpoints..."
IFS=';' read -ra ENDPOINTS <<< "$MOONSHOT_UPDATE_ENDPOINTS_LIST"
for cmd in "${ENDPOINTS[@]}"; do
  cmd=$(replace_placeholders "$cmd")
  echo "Executing: $cmd"
  eval "$cmd"
done

echo "Run completed"