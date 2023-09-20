#!/bin/bash

# Setup PNPM and NX
pnpm setup
pnpm install -g nx

# Create project structure
mkdir assets
mkdir frontend
mkdir backend
mkdir libs
mkdir libs/frontend
mkdir libs/backend
mkdir infrastructure

# Create NX workspace with @monodon/rust plugin
#pnpx create-nx-workspace@latest $WORKSPACE_NAME --preset=@monodon/rust --packageManager=pnpm --nxCloud=false

# Add Playwright
pnpm -i -D @nx/playwright
