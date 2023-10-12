#!/bin/bash
ADAPTER=$1
TYPE=$2
APP_NAME=$3

echo Creating $TYPE named $APP_NAME...

SCRIPT_DIRECTORY=scripts/create-svelte-kit
# Create Svelte skeleton library or app
node $SCRIPT_DIRECTORY/create-skeleton.js $TYPE $APP_NAME

# Install the static adapter and dotenv package
pnpm install --filter=$APP_NAME -D @sveltejs/adapter-$ADAPTER
# pnpm install --filter=$APP_NAME dotenv --save

# Replace default svelte.config.js by preconfigured file
cat $SCRIPT_DIRECTORY/files/$ADAPTER/svelte.config.js > $APP_NAME/svelte.config.js

# Create a +layout.js file at the root route, for settings SSG settings
cat $SCRIPT_DIRECTORY/files/$ADAPTER/+layout.js > $APP_NAME/src/routes/+layout.js

# Install workspace package "assets"
pnpm add --workspace --filter=$APP_NAME assets