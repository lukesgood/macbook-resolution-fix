# MacBook Resolution Fix

Unlock custom resolutions on older MacBooks by generating display override configuration files.

## Features

- Add HiDPI scaled resolutions beyond default options
- Support for various MacBook models
- Simple Python script with no dependencies

## Supported Resolutions

- 1024 x 640
- 1440 x 900 (Recommended)
- 1600 x 1000
- 1680 x 1050
- 1920 x 1200

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/macbook-resolution-fix.git
cd macbook-resolution-fix
```

## Usage

1. Run the script to generate the configuration file:

```bash
python3 create_resolution_config.py
```

2. Copy the generated file to the system directory:

```bash
sudo mkdir -p /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610
sudo cp /tmp/DisplayProductID-9cc5-fixed /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610/
```

3. Restart your Mac

4. Go to System Preferences → Displays and select your desired resolution

## Customization

Edit the `create_resolution_config.py` file to:
- Change `DisplayProductID` and `DisplayVendorID` for your specific model
- Add or remove custom resolutions

### Finding Your Display IDs

```bash
ioreg -lw0 | grep -i "DisplayVendorID\|DisplayProductID"
```

## Compatibility

Tested on:
- MacBook Pro (13-inch, Mid 2012)
- macOS High Sierra and later

## License

MIT License - see [LICENSE](LICENSE) file for details

## Disclaimer

Use at your own risk. Always backup your system before making display configuration changes.
