# Homebrew KopioRapido

Official Homebrew tap for [KopioRapido](https://kopiorapido.com) - intelligent file copying with delta sync, compression, and hardware acceleration.

## Installation

### CLI Only
```bash
brew tap kopiorapido/kopiorapido
brew install kopiorapido
```

### GUI (macOS only)
```bash
brew tap kopiorapido/kopiorapido
brew install --cask kopiorapido-gui
```

### Both CLI and GUI
```bash
brew tap kopiorapido/kopiorapido
brew install kopiorapido kopiorapido-gui
```

## Updating

```bash
brew update
brew upgrade kopiorapido
brew upgrade --cask kopiorapido-gui
```

## Uninstalling

```bash
brew uninstall kopiorapido
brew uninstall --cask kopiorapido-gui
brew untap kopiorapido/kopiorapido
```

## About

KopioRapido provides:
- **Intelligent Transfer Engine**: Automatically analyzes storage devices and file characteristics
- **Delta Sync**: FastRsyncNet integration for efficient incremental updates
- **Transparent Compression**: Brotli compression for network transfers
- **Native Acceleration**: APFS cloning, ReFS block cloning, copy_file_range
- **Multiple Operations**: Copy, Move, Sync, Mirror, and BiDirectionalSync

Visit [kopiorapido.com](https://kopiorapido.com) for more information.

## License

Proprietary - See [LICENSE](https://github.com/KopioRapido/Source/blob/main/LICENSE)
