#!/usr/bin/env python3
"""
MacBook Resolution Fix
Generate custom display resolution configuration for older MacBooks
"""
import plistlib
import sys

def encode_resolution(width, height):
    """Encode resolution to bytes format"""
    return bytes.fromhex(f'{width:08x}{height:08x}0000000100000000')

def generate_config(vendor_id, product_id, custom_resolutions=None):
    """Generate display configuration"""
    default_resolutions = [
        (1024, 640),
        (1440, 900),
        (1600, 1000),
        (1680, 1050),
        (1920, 1200),
    ]
    
    resolutions = custom_resolutions if custom_resolutions else default_resolutions
    
    config = {
        'DisplayProductID': product_id,
        'DisplayVendorID': vendor_id,
        'DisplayProductName': 'Color LCD',
        'scale-resolutions': [encode_resolution(w, h) for w, h in resolutions]
    }
    
    return config

def main():
    if len(sys.argv) < 3:
        vendor_id = 1552  # 0x610
        product_id = 40133  # 0x9cc5
    else:
        vendor_id = int(sys.argv[1])
        product_id = int(sys.argv[2])
    
    # Custom resolutions from command line (optional)
    custom_resolutions = None
    if len(sys.argv) > 3:
        custom_resolutions = []
        for i in range(3, len(sys.argv), 2):
            if i + 1 < len(sys.argv):
                w, h = int(sys.argv[i]), int(sys.argv[i + 1])
                custom_resolutions.append((w, h))
    
    config = generate_config(vendor_id, product_id, custom_resolutions)
    
    product_hex = f'{product_id:x}'
    output_file = f'/tmp/DisplayProductID-{product_hex}'
    
    with open(output_file, 'wb') as f:
        plistlib.dump(config, f)
    
    print(f"✓ Configuration file created: {output_file}")
    print(f"  Vendor ID: {vendor_id} (0x{vendor_id:x})")
    print(f"  Product ID: {product_id} (0x{product_id:x})")
    print("\nAvailable resolutions:")
    for w, h in (custom_resolutions or [(1024, 640), (1440, 900), (1600, 1000), (1680, 1050), (1920, 1200)]):
        print(f"  - {w} x {h}")

if __name__ == '__main__':
    main()
