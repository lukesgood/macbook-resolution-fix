# MacBook Resolution Fix

Unlock custom resolutions on older MacBooks by generating display override configuration files.

## Features

- Add HiDPI scaled resolutions beyond default options
- Enable font smoothing (subpixel antialiasing) for clearer text
- Support for various MacBook models
- Simple scripts with no dependencies

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

### Resolution Configuration

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

### Font Smoothing (Optional)

Enable subpixel antialiasing for clearer text on non-Retina displays:

```bash
./apply_font_smoothing.sh 2
```

Levels: 0 (off), 1 (light), 2 (medium), 3 (strong)

Log out and log back in to apply changes.

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
