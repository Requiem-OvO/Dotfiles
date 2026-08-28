#!/usr/bin/env bash
set -e

echo "Installing opencode..."
curl -fsSL https://opencode.ai/install | bash

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
