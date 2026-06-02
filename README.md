# homebrew-tap

Homebrew tap for [evoglyph](https://evoglyph.com/) — a local-first, on-device dictation app for macOS. All transcription runs on your Mac; nothing is sent to the cloud. evoglyph is code-signed, notarized, and distributed as a standard `.app` bundle.

## Install

One step:

```sh
brew install --cask evoglyph/tap/evoglyph
```

Two steps:

```sh
brew tap evoglyph/tap
brew install --cask evoglyph
```

## Requirements

- Apple Silicon (arm64)
- macOS 14 (Sonoma) or later

## Updates

After install, evoglyph self-updates in-app via [Sparkle](https://sparkle-project.org/). The cask sets `auto_updates true`, so `brew upgrade` defers to Sparkle and will not fight the in-app updater.

## Maintainer

The cask's `version` and `sha256` are kept current automatically by the app's release script (`Scripts/release.sh`); they are not meant to be edited by hand.
