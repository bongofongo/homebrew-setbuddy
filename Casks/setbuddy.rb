cask "setbuddy" do
  version "0.1.0"
  # Filled in by scripts/release-mac.sh when the release is cut. A wrong value
  # here is not a silent failure: brew refuses the download.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/bongofongo/setbuddy/releases/download/v#{version}/Setbuddy-#{version}.zip",
      verified: "github.com/bongofongo/setbuddy/"
  name "Setbuddy"
  desc "Menu-bar player for downloaded DJ sets and music"
  homepage "https://github.com/bongofongo/setbuddy"

  # The app gates its whole UI on mpv being present, and mpv brings ffmpeg and
  # ffprobe with it, which is where track metadata and thumbnails come from.
  depends_on formula: "mpv"
  # Sonoma or newer, matching LSMinimumSystemVersion in the bundle.
  depends_on macos: :sonoma

  app "Setbuddy.app"
  # The same core, driven from a shell: `setbuddy play <file|query>`.
  binary "#{appdir}/Setbuddy.app/Contents/MacOS/setbuddy", target: "setbuddy"

  # A menu-bar app has no window to close, so an upgrade would otherwise leave
  # the old build running — and holding the playback socket.
  uninstall quit: "com.toadmountain.setbuddy"

  # The library index, resume positions and cached artwork. Not touched by
  # uninstall: someone reinstalling wants their library back.
  zap trash: "~/Library/Application Support/Setbuddy"
end
