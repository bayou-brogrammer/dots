#!/bin/bash

# Simple script to generate conventional commits using commitizen
# This script uses the existing .cz.toml configuration

# Check if commitizen is installed
if ! command -v cz &> /dev/null; then
    echo "Commitizen is not installed. Installing now..."
    pip install commitizen
fi

# Check if there are staged changes
if [ -z "$(git diff --staged)" ]; then
    echo "No staged changes found. Would you like to:"
    echo "1. Stage all changes"
    echo "2. Exit and stage changes manually"
    read -p "Enter your choice (1/2): " choice
    
    if [ "$choice" = "1" ]; then
        git add .
        echo "All changes have been staged."
    else
        echo "Please stage your changes with 'git add' and run this script again."
        exit 0
    fi
fi

# Use commitizen to create the commit
echo "Generating commit message using conventional commits..."
cz commit

# Show the last commit
echo -e "\nLast commit:"
git log -1 --pretty=format:"%C(yellow)%h%Creset %s %C(cyan)(%cr)%Creset"
