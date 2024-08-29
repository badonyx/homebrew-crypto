cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.33.5"
  sha256 arm:   "cc4e3b31ba78c9c053874d26c8994da384c376e2290184f0fcab3e39ef5b20f2",
         intel: "33931211eecaad4519a0db4169e6b1e3b0b48064f966762e382dff366e5cb40f"

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
