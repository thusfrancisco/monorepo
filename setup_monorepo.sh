#!/bin/bash

# Setup PNPM and NX
pnpm setup
pnpm init
pnpm install -g nx

# Create project structure
mkdir frontend
mkdir backend
mkdir libs
mkdir libs/frontend
mkdir libs/backend
mkdir infrastructure

# Add NX as a dev dependency to the PNPM workspace
pnpx nx@latest init

# Add the @monodon/rust plugin to the NX workspace
pnpm add -D -w @monodon/rust

# Add Playwright
pnpm -i -D @nx/playwright
