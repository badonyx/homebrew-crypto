cask "atani" do
  arch arm: "-arm64"

  version "14.39.0"
  sha256 arm:   "3d03f3683230d232e7a36cd7115310d50a8f8d98a7594dc17e6d889a7a6df4e9",
         intel: "c25e66874a3ee16ce7b09a2abdee89b00599c6609ee91109a13b72be81679828"

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
