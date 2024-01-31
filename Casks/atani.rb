cask "atani" do
  arch arm: "-arm64"

  version "14.41.2"
  sha256 arm:   "7fbd8596bb958f7ae64c205627df12ad9be70bd12afe925c508008b09887cd06",
         intel: "127d8bc6c282168a4e6c582611efded2f7ab52c29f0d7577e9477df984cb6828"

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
    "~/Library/Application Support/Atani",
    "~/Library/Application Support/Caches/atani-updater",
    "~/Library/Caches/com.atani.desktop",
    "~/Library/Caches/com.atani.desktop.ShipIt",
    "~/Library/Logs/Atani",
    "~/Library/Preferences/com.atani.desktop.plist",
    "~/Library/Saved Application State/com.atani.desktop.savedState",
  ]
end
