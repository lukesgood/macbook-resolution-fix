#!/bin/bash
# Verify installation

echo "=== MacBook Resolution Fix - Verification ==="
echo ""

# Detect display IDs
VENDOR_ID=$(ioreg -lw0 | grep -i "DisplayVendorID" | head -1 | awk '{print $NF}')
PRODUCT_ID=$(ioreg -lw0 | grep -i "DisplayProductID" | head -1 | awk '{print $NF}')

if [[ -z "$VENDOR_ID" ]] || [[ -z "$PRODUCT_ID" ]]; then
    echo "❌ Could not detect display IDs"
    exit 1
fi

VENDOR_HEX=$(printf "%x" "$VENDOR_ID")
PRODUCT_HEX=$(printf "%x" "$PRODUCT_ID")

echo "Display Information:"
echo "  Vendor ID: $VENDOR_ID (0x$VENDOR_HEX)"
echo "  Product ID: $PRODUCT_ID (0x$PRODUCT_HEX)"
echo ""

# Check configuration file
OVERRIDE_DIR="/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-$VENDOR_HEX"
CONFIG_FILE="$OVERRIDE_DIR/DisplayProductID-$PRODUCT_HEX"

if [[ -f "$CONFIG_FILE" ]]; then
    echo "✅ Configuration file installed: $CONFIG_FILE"
else
    echo "❌ Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Check font smoothing
FONT_SMOOTHING=$(defaults read -g AppleFontSmoothing 2>/dev/null || echo "not set")
echo ""
echo "Font Smoothing: $FONT_SMOOTHING"

# Check backup
BACKUP_DIR="$HOME/.macbook-resolution-backup"
if [[ -d "$BACKUP_DIR" ]]; then
    BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | wc -l | tr -d ' ')
    echo "Backups: $BACKUP_COUNT found in $BACKUP_DIR"
else
    echo "Backups: None"
fi

echo ""
echo "✅ Verification complete!"
