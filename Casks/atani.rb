cask "atani" do
  arch arm: "-arm64"

  version "14.45.0"
  sha256 arm:   "25f18918076286f1c1a953c4b0b264793dd1ccd2b3bde52695e346793129e022",
         intel: "19912ec15acabf75e04932a70ff2d7b9b51c57906dc05c5e313381673538db7e"

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
