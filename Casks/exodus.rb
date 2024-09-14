cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.37.2"
  sha256 arm:   "9c27f3d0f071da73dde307a46f66c0bb848b3273ffa3b95d726deaa154ce466c",
         intel: "7c6c70600f3092e0fe3f042dadcacf6d96892d5987a996775874183f4204f885"

  url "https://downloads.exodus.com/releases/exodus-#{arch}-#{version}.dmg",
      user_agent: :fake
  name "Exodus"
  desc "Desktop wallet for cryptocurrency assets"
  homepage "https://www.exodus.com/"

  livecheck do
    url "https://www.exodus.com/releases/"
    regex(%r{/hashes[._-]exodus[._-]?v?(\d+(?:\.\d+)+)\.txt}i)
  end

  auto_updates true

  app "Exodus.app"

  zap trash: [
    "~/Library/Application Support/Exodus",
    "~/Library/Preferences/com.electron.exodus.helper.plist",
    "~/Library/Preferences/com.electron.exodus.plist",
    "~/Library/Saved Application State/com.electron.exodus.savedState",
  ]
end
