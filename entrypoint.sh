#!/bin/bash

# Recommended by Github
# https://developer.github.com/actions/creating-github-actions/creating-a-new-action/#using-shell-scripts-to-create-actions
set -e

source ./utils.sh

check_var "SOURCE_BRANCH"
check_var "TARGET_BRANCH"

# Also recommended by Github, setting after graceful variable checks
set -u

COMMIT_MESSAGE=$(get_commit_message)

echo "Commit Message:"
echo $COMMIT_MESSAGE

REPO_FULLNAME=$(jq --raw-output .pull_request.head.repo.name "$GITHUB_EVENT_PATH")
echo $REPO_FULLNAME
echo $GITHUB_REPOSITORY
cat $GITHUB_EVENT_PATH
