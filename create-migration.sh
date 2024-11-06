#!/bin/zsh

set -e

# test if the repository is clean
test -z "$(git status --porcelain)" || (echo "Current repository not clean. Please commit your changes first" && exit 1)

current_git_date=$(git log -1 --format=%cd --date=unix)
touch migrations/${current_git_date}.sh