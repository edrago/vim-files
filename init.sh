#!/bin/bash
# Initialize Vim setup.

# This script fetch the Vundle repo and subsequently install all bundles.

echo "Fetching Vundle repository..."
cd bundle/vundle
git pull origin

cd .. && cd ..

echo
exec ./update-bundles.sh
