#!/bin/bash

# Install moonshot package with all dependencies
echo "Installing moonshot..."
pip install "aiverify-moonshot[all]==0.4.5"

# Clone the forked repository and install its requirements
echo "Cloning forked repository and installing requirements..."
pip install -r requirements.txt

# Set logging information
echo "Setting log info..."
export MS_LOG_NAME=moonshot
export MS_LOG_LEVEL=debug
export MS_LOG_TO_FILE=true

# Create environment variables file
echo "Creating env file..."
cat <<EOF >> .env
ATTACK_MODULES="./attack-modules"
BOOKMARKS="./generated-outputs/bookmarks"
CONNECTORS="./connectors"
CONNECTORS_ENDPOINTS="./connectors-endpoints"
CONTEXT_STRATEGY="./context-strategy"
COOKBOOKS="./cookbooks"
DATABASES="./generated-outputs/databases"
DATABASES_MODULES="./databases-modules"
DATASETS="./datasets"
IO_MODULES="./io-modules"
METRICS="./metrics"
PROMPT_TEMPLATES="./prompt-templates"
RECIPES="./recipes"
RESULTS="./generated-outputs/results"
RESULTS_MODULES="./results-modules"
RUNNERS="./generated-outputs/runners"
RUNNERS_MODULES="./runners-modules"
TOKENIZERS_PARALLELISM=false
HOST_ADDRESS=127.0.0.1
HOST_PORT=5000
MOONSHOT_UI_CALLBACK_URL=http://localhost:3000/api/v1/benchmarks/status
EOF