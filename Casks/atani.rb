cask "atani" do
  arch arm: "-arm64"

  version "14.36.0"
  sha256 arm:   "50dba0fdf50e1fb672e5df0c61c3acc89f43d658e5cd86b63c22448cdeed70aa",
         intel: "8d6dc62910d2cdce7e14a0b5f0355829c75380ca0ce4cdfeb72cacd0fa294212"

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
