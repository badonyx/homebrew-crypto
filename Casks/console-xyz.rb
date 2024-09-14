cask "console-xyz" do
  version "0.3.4"
  sha256 :no_check

  url "https://download.console.xyz/mac/Console.dmg"
  name "Console"
  desc "Group chat for web3 communities"
  homepage "https://www.console.xyz/"

  livecheck do
    strategy :extract_plist
  end

  app "Console.app", target: "Console XYZ.app"

  zap trash: [
    "~/Library/Application Support/Console",
    "~/Library/Logs/Console",
    "~/Library/Preferences/com.electron.console.plist",
    "~/Library/Saved Application State/com.electron.console.savedState/",
  ]

  caveats do
    requires_rosetta
  end
end
