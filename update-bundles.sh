#!/bin/bash
# Install/Update bundles using Vundle

echo "Updating Vim plugins, please wait..." 
vim -Nu ./.vundle.vim +BundleInstall +qa
