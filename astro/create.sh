#!/bin/bash
ADAPTER=$1
APP_NAME=$2

echo Creating app "$APP_NAME"

cd $TARGET

# Create Astro project based on Svelte template
pnpm create astro@latest $APP_NAME --template framework-svelte --no-install --no-git --typescript strict
# Reference: https://www.npmjs.com/package/create-astro

# Install packages
pnpm install --filter=$APP_NAME

# Install workspace package "assets"
pnpm add --workspace --filter=$APP_NAME assets

# Install Svelte
pnpm install --filter=$APP_NAME svelte
pnpm install --filter=$APP_NAME @astrojs/svelte

# Install NodeJS
pnpm install --filter=$APP_NAME @astrojs/node

# Copy template files
cp -a astro/files/.  $TARGET/$APP_NAME
