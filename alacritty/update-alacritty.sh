#!/usr/bin/env bash

set -e

echo "Updating Alacritty to latest version..."

# Check if cargo is installed
if ! command -v cargo &> /dev/null; then
    echo "Error: cargo not found. Please install Rust first:"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Update Alacritty via cargo
echo "Installing/updating Alacritty via cargo..."
cargo install alacritty

# Check version
echo ""
echo "Alacritty updated successfully!"
alacritty --version
echo "Restart your terminal to use the new version."
