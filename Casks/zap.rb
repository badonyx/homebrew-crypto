cask "zap" do
  version "0.7.7-beta"
  sha256 "224a0fb5d731fab9a8e62510b2fa1f0672c63bd41f279f5d731a7942b6447b68"

  url "https://github.com/LN-Zap/zap-desktop/releases/download/v#{version}/Zap-mac-v#{version}.dmg",
      verified: "github.com/LN-Zap/zap-desktop/"
  name "Zap"
  desc "Cross platform Lightning Network wallet"
  homepage "https://zaphq.io/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+(?:-\w+))/i)
  end

  app "Zap.app"

  zap trash: [
    "~/Library/Application Support/Zap",
    "~/Library/Preferences/org.develar.Zap.plist",
    "~/Library/Saved Application State/org.develar.Zap.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
