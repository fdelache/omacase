#!/bin/bash

# Check if the operating system is macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "This script is intended to run on macOS. Exiting."
    exit 1
fi
