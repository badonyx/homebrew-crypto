cask "atani" do
  arch arm: "-arm64"

  version "14.33.1"
  sha256 arm:   "caf1a8d76492ef78f3cc062a7704659a2703d4cc41c8daccbb76ea39ecf6269e",
         intel: "d03c149c145fa10b98751a3a5a69ff4254d76c885544c895c8d7c731fc8528f1"

  url "https://cdn.atani.com/desktop/releases/Atani-#{version}#{arch}.dmg"
  name "Atani"
  desc "Multi-exchange aggregator for trading crypto"
  homepage "https://atani.com/"

  livecheck do
    url "https://cdn.atani.com/desktop/releases/latest-mac.yml"
    regex(/Atani[._-]v?(\d+(?:\.\d+)+)/i)
    strategy :yaml do |yaml|
      yaml["version"]
    end
  end

  app "Atani.app"

  zap trash: [
    "~/Library/Application Support/Caches/atani-updater",
    "~/Library/Application Support/Atani",
    "~/Library/Caches/com.atani.desktop",
    "~/Library/Caches/com.atani.desktop.ShipIt",
    "~/Library/Logs/Atani",
    "~/Library/Preferences/com.atani.desktop.plist",
    "~/Library/Saved Application State/com.atani.desktop.savedState",
  ]
end
