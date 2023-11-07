cask "atani" do
  arch arm: "-arm64"

  version "14.37.0"
  sha256 arm:   "0092b54c7c6578fbefe267c6d986343c718dc758a6aa7e696ee94a5f2c9a2ecf",
         intel: "442a1008ee710ef19f693359995ed65c6adfd7fd5bd71003a8c5cfa8d2b67149"

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
