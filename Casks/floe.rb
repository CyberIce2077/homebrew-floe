cask "floe" do
  version "0.2.0"
  sha256 "7ce5d4107ed3e23571d4cbbc7cde7c2cb7fd4f38ab29828b726574a38b9d936b"

  url "https://github.com/CyberIce2077/floe/releases/download/v#{version}/Floe-#{version}.zip"
  name "Floe"
  desc "Menu bar window switcher with previews, quit on close, maximize and stay awake"
  homepage "https://github.com/CyberIce2077/floe"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Floe.app"

  # Floe is signed but not notarized, so Gatekeeper would block the download; lift its quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Floe.app"]
  end

  uninstall quit: "io.github.cyberice2077.floe"

  zap trash: "~/Library/Preferences/io.github.cyberice2077.floe.plist"
end
