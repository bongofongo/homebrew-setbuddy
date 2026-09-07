# Homebrew tap for Setbuddy

[Setbuddy](https://github.com/bongofongo/setbuddy) is a macOS menu-bar player
for downloaded DJ sets and music.

```sh
brew install --cask bongofongo/setbuddy/setbuddy
```

This pulls in `mpv`, which Setbuddy plays through and which brings `ffmpeg` and
`ffprobe` for metadata and thumbnails. The build is universal, signed with a
Developer ID and notarised, so Gatekeeper clears it without a right-click.
