#!/bin/bash
ADAPTER=$1
APP_NAME=$2

echo Creating app "$APP_NAME"

SCRIPT_DIRECTORY=scripts/create-astro

# Create Astro project based on Svelte template
npm create astro@latest $APP_NAME --template framework-svelte --no-install --no-git --typescript strict
# Reference: https://www.npmjs.com/package/create-astro

# Install packages
pnpm install --filter=$APP_NAME

# Install workspace package "assets"
pnpm add --workspace --filter=$APP_NAME assets
