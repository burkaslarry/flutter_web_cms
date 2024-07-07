#!/bin/bash

# Navigate to the project directory
cd ~/flutter_web_cms

# Check if a package name is provided as an argument
if [ -z "$1" ]; then
    echo "Please provide a deployment name as an argument."
    exit 1
fi

# Release app 
flutter build "$1"
