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

## Quick Start

```bash
git clone https://github.com/lukesgood/macbook-resolution-fix.git
cd macbook-resolution-fix
chmod +x *.sh
./install.sh
```

Restart your Mac and select your desired resolution in System Preferences → Displays.

## Usage

### Automatic Installation (Recommended)

```bash
./install.sh
```

Automatically detects your display IDs, creates backup, and installs configuration.

### Manual Installation

1. Generate configuration:

```bash
python3 create_resolution_config.py
```

2. Install:

```bash
sudo mkdir -p /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610
sudo cp /tmp/DisplayProductID-9cc5 /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-610/
```

3. Restart your Mac

### Font Smoothing (Optional)

```bash
./apply_font_smoothing.sh 2
```

Levels: 0 (off), 1 (light), 2 (medium), 3 (strong). Log out to apply.

### Custom Resolutions

```bash
python3 create_resolution_config.py <vendor_id> <product_id> <width1> <height1> <width2> <height2> ...
```

Example:
```bash
python3 create_resolution_config.py 1552 40133 1440 900 1920 1200
```

### Verification

```bash
./verify.sh
```

### Uninstall

```bash
./uninstall.sh
```

### Restore from Backup

```bash
./restore.sh
```

## Compatibility

Tested on:
- MacBook Pro (13-inch, Mid 2012)
- macOS High Sierra and later

## License

MIT License - see [LICENSE](LICENSE) file for details

## Disclaimer

Use at your own risk. Always backup your system before making display configuration changes.
