#!/bin/bash
# Restore from backup

BACKUP_DIR="$HOME/.macbook-resolution-backup"

if [[ ! -d "$BACKUP_DIR" ]]; then
    echo "❌ No backups found in $BACKUP_DIR"
    exit 1
fi

echo "=== Available Backups ==="
echo ""
ls -1 "$BACKUP_DIR"
echo ""
read -p "Enter backup folder name to restore: " BACKUP_NAME

BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

if [[ ! -d "$BACKUP_PATH" ]]; then
    echo "❌ Backup not found: $BACKUP_PATH"
    exit 1
fi

echo ""
echo "📦 Restoring from backup..."
sudo cp -r "$BACKUP_PATH" /Library/Displays/Contents/Resources/Overrides/

echo ""
echo "✅ Restore complete!"
echo "Restart your Mac to apply changes"
