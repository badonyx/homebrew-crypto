cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.27.3"
  sha256 arm:   "c92fc3b7dcc3e4acc86329561600a23843b7dfa988b808926b0edbf49265731d",
         intel: "bb5b309df05e4ccb9e5f91c798320a0c68a8d59b2f17f22bdc646c3998f233fe"

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
