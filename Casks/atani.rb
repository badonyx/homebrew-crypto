cask "atani" do
  arch arm: "-arm64"

  version "14.35.0"
  sha256 arm:   "97e9b1cf44f3f41bccdb9b3461961f079f9c8fc273c995c0f18bb7a094e11b7c",
         intel: "c3d11e8153595bff9f956e1c8dc2c793f9dd21387b17c3e38434b7d3cc2a1fcd"

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
