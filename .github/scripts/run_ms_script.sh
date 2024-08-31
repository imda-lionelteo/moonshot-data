#!/bin/bash

# Update endpoints based on the provided list
echo "Updating endpoints..."
IFS=';' read -ra ENDPOINTS <<< "$MOONSHOT_UPDATE_ENDPOINTS_LIST"
for cmd in "${ENDPOINTS[@]}"; do
  echo "Executing: $cmd"
  eval "$cmd"
done

# # Trigger the cookbook run, which may take some time
# echo "Triggering cookbook run... This may take some time."
# IFS=';' read -ra COOKBOOKS <<< "$MOONSHOT_RUN_COOKBOOKS_LIST"
# for cmd in "${COOKBOOKS[@]}"; do
#   echo "Executing: $cmd"
#   eval "$cmd"
# done

echo "Run completed"