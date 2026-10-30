cask "floe" do
  version "0.2.1"
  sha256 "6f5c1b70826e1c451d0a39d9a56ffde97aef0062d1c88bf8a6e454611bdad693"

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
