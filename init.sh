#!/bin/bash
# Initialize Vim setup.

# This script fetch the Vundle repo and subsequently install all bundles.

echo "Fetching Vundle repository..."
git submodule init
git submodule update
echo
exec ./update-bundles.sh
