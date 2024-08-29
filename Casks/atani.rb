cask "atani" do
  arch arm: "-arm64"

  version "14.48.0"
  sha256 arm:   "1bd7e0e8a149fa648198b4208c356eae7503f3ed1aa8e74b22c1fc4338cb2bfe",
         intel: "fa81e10e591121aa46ee750018cb1661f116590ce6e3d0c9155c33609d924f52"

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
