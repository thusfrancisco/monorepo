#!/bin/bash
ADAPTER=$1
TYPE=$2
APP_NAME=$3

echo Creating $TYPE named $APP_NAME...

# cd to $TARGET
cd $TARGET

# Create Svelte skeleton library or app
node $MAKE_DIR/svelte-kit/create-skeleton.js $TYPE $APP_NAME

# Install the static adapter and dotenv package
pnpm install --filter=$APP_NAME -D @sveltejs/adapter-$ADAPTER
# pnpm install --filter=$APP_NAME dotenv --save

SOURCE_DIR=$TARGET/$MAKE_DIR/svelte-kit/files/$ADAPTER
# Replace default svelte.config.js by preconfigured file
cat $SOURCE_DIR/svelte.config.js > $APP_NAME/svelte.config.js
# Create a +layout.js file at the root route, for settings SSG settings
cat $SOURCE_DIR/+layout.js > $APP_NAME/src/routes/+layout.js

# Install workspace package "assets"
pnpm add --workspace --filter=$APP_NAME assets
