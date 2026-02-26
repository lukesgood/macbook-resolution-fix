#!/usr/bin/env python3
"""
MacBook Resolution Fix
Generate custom display resolution configuration for older MacBooks
"""
import plistlib

# Display configuration
# Change these values for your specific MacBook model
DISPLAY_CONFIG = {
    'DisplayProductID': 40133,  # 0x9cc5
    'DisplayVendorID': 1552,    # 0x610
    'DisplayProductName': 'Color LCD',
    'scale-resolutions': [
        bytes.fromhex('000005a0000003840000000100000000'),  # 1440x900
        bytes.fromhex('00000690000004 1a0000000100000000'),  # 1680x1050
        bytes.fromhex('00000640000003e80000000100000000'),  # 1600x1000
        bytes.fromhex('00000780000004b00000000100000000'),  # 1920x1200
        bytes.fromhex('00000400000002800000000100000000'),  # 1024x640
    ]
}

OUTPUT_FILE = '/tmp/DisplayProductID-9cc5-fixed'

def main():
    with open(OUTPUT_FILE, 'wb') as f:
        plistlib.dump(DISPLAY_CONFIG, f)
    
    print(f"✓ Configuration file created: {OUTPUT_FILE}")
    print("\nAvailable resolutions:")
    print("  - 1024 x 640")
    print("  - 1440 x 900  (Recommended)")
    print("  - 1600 x 1000")
    print("  - 1680 x 1050")
    print("  - 1920 x 1200")
    print("\nNext steps:")
    print("  1. sudo mkdir -p /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610")
    print(f"  2. sudo cp {OUTPUT_FILE} /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610/")
    print("  3. Restart your Mac")

if __name__ == '__main__':
    main()
