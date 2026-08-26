#!/usr/bin/env bash
set -e

echo "Installing opencode..."
curl -fsSL https://opencode.ai/install | bash

echo "opencode installed: $(opencode --version 2>&1 || echo 'verify with: ~/.opencode/bin/opencode --version')"
