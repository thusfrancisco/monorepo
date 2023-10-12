#!/bin/bash
# Setup PNPM
source setup_pnpm.sh

# Create project structure
mkdir assets
mkdir frontend
mkdir backend
mkdir libs
mkdir libs/frontend
mkdir libs/backend
mkdir infrastructure

# Setup PNPM Workspace
cat scripts/monorepo/files/pnpm-workspace.yaml > pnpm-workspace.yaml
pnpm init

# Setup NX Workspace
cat scripts/monorepo/files/nx.json > nx.json
pnpm install -g nx
pnpx nx@latest init

# Add the @monodon/rust plugin to the NX workspace
pnpm add -D -w @monodon/rust

# Add Playwright
pnpm install -D -w @nx/playwright
