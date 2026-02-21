#!/usr/bin/env bash
set -euo pipefail

# Configure SSH for GitHub
mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts 2>/dev/null

# Configure git defaults
git config --global init.defaultBranch main
git config --global user.name "Claude Town Bot"
git config --global user.email "claude-town-bot@automated.local"

# Authenticate gh CLI if GITHUB_TOKEN is set
if [ -n "${GITHUB_TOKEN:-}" ]; then
  echo "${GITHUB_TOKEN}" | gh auth login --with-token 2>/dev/null || true
fi

PORT="${CLAUDE_PTY_PORT:-7681}"

echo "Starting Claude PTY server on port ${PORT}..."

# ttyd flags:
#   -W  writable (allow input from WebSocket clients)
#   -p  port
#   -t  terminal options
exec ttyd -W -p "${PORT}" -t fontSize=14 -t disableLeaveAlert=true /bin/bash
