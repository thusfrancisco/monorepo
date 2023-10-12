#!/bin/bash
# Install NPM
sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm

# Install PNPM
npm install -g pnpm
pnpm setup
