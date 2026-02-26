#!/bin/bash
# Auto-install script for MacBook resolution fix

set -e

echo "=== MacBook Resolution Fix - Auto Installer ==="
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script only works on macOS"
    exit 1
fi

# Detect display IDs
echo "🔍 Detecting display information..."
VENDOR_ID=$(ioreg -lw0 | grep -i "DisplayVendorID" | head -1 | awk '{print $NF}')
PRODUCT_ID=$(ioreg -lw0 | grep -i "DisplayProductID" | head -1 | awk '{print $NF}')

if [[ -z "$VENDOR_ID" ]] || [[ -z "$PRODUCT_ID" ]]; then
    echo "❌ Could not detect display IDs"
    exit 1
fi

VENDOR_HEX=$(printf "%x" "$VENDOR_ID")
PRODUCT_HEX=$(printf "%x" "$PRODUCT_ID")

echo "✓ Display Vendor ID: $VENDOR_ID (0x$VENDOR_HEX)"
echo "✓ Display Product ID: $PRODUCT_ID (0x$PRODUCT_HEX)"
echo ""

# Backup existing configuration
OVERRIDE_DIR="/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR_HEX"
BACKUP_DIR="$HOME/.macbook-resolution-backup"

if [[ -d "$OVERRIDE_DIR" ]]; then
    echo "📦 Backing up existing configuration..."
    mkdir -p "$BACKUP_DIR"
    sudo cp -r "$OVERRIDE_DIR" "$BACKUP_DIR/DisplayVendorID-$VENDOR_HEX-$(date +%Y%m%d-%H%M%S)"
    echo "✓ Backup saved to $BACKUP_DIR"
    echo ""
fi

# Generate configuration
echo "⚙️  Generating resolution configuration..."
python3 create_resolution_config.py "$VENDOR_ID" "$PRODUCT_ID"

# Install configuration
echo ""
echo "📥 Installing configuration (requires sudo)..."
sudo mkdir -p "$OVERRIDE_DIR"
sudo cp "/tmp/DisplayProductID-$PRODUCT_HEX" "$OVERRIDE_DIR/"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your Mac"
echo "  2. Go to System Preferences → Displays"
echo "  3. Select your desired resolution"
echo ""
echo "Optional: Apply font smoothing for clearer text"
echo "  ./apply_font_smoothing.sh 2"
