#!/usr/bin/env bash
set -e

echo "Installing opencode..."
curl -fsSL https://opencode.ai/install | bash

cp "$(dirname "$0")/opencode.json" "/workspaces/${GITHUB_REPOSITORY##*/}/opencode.json" 2>/dev/null || true
cp -r "$(dirname "$0")/.agents" "/workspaces/${GITHUB_REPOSITORY##*/}/" 2>/dev/null || cp -r "$(dirname "$0")/agents" "/workspaces/${GITHUB_REPOSITORY##*/}/.agents" 2>/dev/null || true
touch "/workspaces/${GITHUB_REPOSITORY##*/}/.gitignore" 2>/dev/null || true
grep -qxF "opencode.json" "/workspaces/${GITHUB_REPOSITORY##*/}/.gitignore" 2>/dev/null || echo "opencode.json" >> "/workspaces/${GITHUB_REPOSITORY##*/}/.gitignore"
grep -qxF ".agents/" "/workspaces/${GITHUB_REPOSITORY##*/}/.gitignore" 2>/dev/null || echo ".agents/" >> "/workspaces/${GITHUB_REPOSITORY##*/}/.gitignore"

echo "Installing ponytail plugin..."
copilot plugin marketplace add DietrichGebert/ponytail
copilot plugin install ponytail@ponytail

echo "Installing open-code-review..."
npm install -g @alibaba-group/open-code-review

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
#export PATH="$HOME/.local/bin:$PATH"

# echo "Installing mempalace..."
# uv tool install mempalace

# echo "Registering mempalace MCP..."
# if command -v opencode >/dev/null 2>&1; then
#   opencode mcp add mempalace -- mempalace-mcp 2>/dev/null || true
# elif [ -x "$HOME/.opencode/bin/opencode" ]; then
#   "$HOME/.opencode/bin/opencode" mcp add mempalace -- mempalace-mcp 2>/dev/null || true
# fi

echo "All tools installed successfully."
