cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.23.3"
  sha256 arm:   "136cf2625517aa56953d76c51800c34c4c8c7697b002f5aa25af1b758277cb95",
         intel: "d4a427766ab0e91085d4ae6af5a8e3adaa2317169f0edec4d6e7b0c348720db6"

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
