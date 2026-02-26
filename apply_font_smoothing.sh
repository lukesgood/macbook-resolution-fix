#!/bin/bash
# Apply font smoothing (subpixel antialiasing) for better text clarity

LEVEL=${1:-2}

if [[ ! "$LEVEL" =~ ^[0-3]$ ]]; then
    echo "Usage: $0 [0-3]"
    echo "  0 = Off"
    echo "  1 = Light"
    echo "  2 = Medium (default)"
    echo "  3 = Strong"
    exit 1
fi

defaults write -g AppleFontSmoothing -int "$LEVEL"

echo "✓ Font smoothing set to level $LEVEL"
echo ""
echo "Log out and log back in to apply changes"
