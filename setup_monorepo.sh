#!/bin/bash

# Setup PNPM and NX
pnpm setup
pnpm install -g nx

# Create NX workspace with @monodon/rust plugin
WORKSPACE_NAME="monorepo"

pnpx create-nx-workspace@latest $WORKSPACE_NAME --preset=@monodon/rust --packageManager=pnpm --nxCloud=false

# Add @nxext/svelte plugin
cd $WORKSPACE_NAME
pnpm install @nxext/svelte --save-dev

# Add Playwright
pnpm -i -D @nx/playwright
