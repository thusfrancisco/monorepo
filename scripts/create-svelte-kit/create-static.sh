#!/bin/bash
TYPE=$1
APP_NAME=$2

echo Creating $TYPE named $APP_NAME...

SCRIPT_DIRECTORY=scripts/create-svelte-kit
# Create Svelte skeleton library or app
node $SCRIPT_DIRECTORY/create-skeleton.js $TYPE $APP_NAME

# Install the static adapter and dotenv package
pnpm install --filter=$APP_NAME -D @sveltejs/adapter-static
pnpm install --filter=$APP_NAME dotenv --save

# Replace default svelte.config.js by preconfigured file
cat $SCRIPT_DIRECTORY/files/svelte.config.js > $APP_NAME/svelte.config.js

# Create a +layout.js file at the root route, for settings SSG settings
cat $SCRIPT_DIRECTORY/files/+layout.js > $APP_NAME/src/routes/+layout.js

# Specify package to copy assets from
