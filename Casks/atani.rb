cask "atani" do
  arch arm: "-arm64"

  version "14.47.0"
  sha256 arm:   "9f8ebb428b8d2ab9cc6bf6f68634bf68e273f395b6d9f1370a101328646e2582",
         intel: "8427d2bebd300261205d45aaa638e372de1a1aedddcf3e18469fd0d2fa46809a"

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
