#!/bin/bash

if sw_vers >/dev/null 2>&1; then
    echo "MacOs not found."
    echo "Installation stopped."
    exit 1
fi
