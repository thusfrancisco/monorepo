#!/bin/bash
# Copy files to $TARGET
cp -a scripts/monorepo/files/. $TARGET/

# cd to $TARGET
cd $TARGET

# Create project structure
mkdir assets
mkdir frontend
mkdir backend
mkdir libs
mkdir libs/frontend
mkdir libs/backend
mkdir infrastructure

# Setup PNPM
source setup_pnpm.sh

# Setup PNPM Workspace
pnpm init

# Setup NX Workspace
pnpm install -g nx
pnpx nx@latest init

# Add the @monodon/rust plugin to the NX workspace
pnpm add -D -w @monodon/rust

# Add Playwright
pnpm install -D -w @nx/playwright
