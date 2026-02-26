#!/bin/bash
# Uninstall MacBook resolution fix

set -e

echo "=== MacBook Resolution Fix - Uninstaller ==="
echo ""

# Detect display IDs
VENDOR_ID=$(ioreg -lw0 | grep -i "DisplayVendorID" | head -1 | awk '{print $NF}')

if [[ -z "$VENDOR_ID" ]]; then
    echo "❌ Could not detect display vendor ID"
    exit 1
fi

VENDOR_HEX=$(printf "%x" "$VENDOR_ID")
OVERRIDE_DIR="/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR_HEX"

if [[ ! -d "$OVERRIDE_DIR" ]]; then
    echo "✓ No custom resolution configuration found"
    exit 0
fi

echo "🗑️  Removing custom resolution configuration..."
sudo rm -rf "$OVERRIDE_DIR"

echo ""
echo "✅ Uninstallation complete!"
echo ""
echo "Restart your Mac to apply changes"
echo ""
echo "Backups are preserved in: $HOME/.macbook-resolution-backup"
