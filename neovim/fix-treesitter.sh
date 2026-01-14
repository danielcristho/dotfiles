#!/usr/bin/env bash

echo "Fixing Treesitter..."

# Remove old parsers
rm -rf ~/.local/share/nvim/site/pack/*/start/nvim-treesitter/parser/*

# Install tree-sitter CLI if not present
if ! command -v tree-sitter &> /dev/null; then
    echo "Installing tree-sitter CLI..."
    npm install -g tree-sitter-cli
fi

echo "Done! Now open Neovim and run:"
echo "   :TSInstall lua vim python javascript go"
