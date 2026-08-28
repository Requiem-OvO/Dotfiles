#!/usr/bin/env bash
set -e

echo "Installing opencode..."
curl -fsSL https://opencode.ai/install | bash

echo "opencode installed: $(opencode --version 2>&1 || echo 'verify with: ~/.opencode/bin/opencode --version')"

echo "Installing ponytail plugin..."
copilot plugin marketplace add DietrichGebert/ponytail
copilot plugin install ponytail@ponytail

echo "Installing open-code-review..."
npm install -g @alibaba-group/open-code-review

echo "All tools installed successfully."
