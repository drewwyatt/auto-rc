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
create_pull_request "${COMMIT_MESSAGE}"
