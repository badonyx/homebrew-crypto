cask "console-desktop" do
  version "0.1.34"
  sha256 :no_check

  url "https://download.console.xyz/mac/Console.dmg"
  name "Console"
  desc "Group chat for web3 communities"
  homepage "https://www.console.xyz/"

  livecheck do
    strategy :extract_plist
  end

  app "Console.app", target: "Console Desktop.app"

  zap trash: [
    "~/Library/Application Support/Console",
    "~/Library/Preferences/com.electron.console.plist",
    "~/Library/Saved Application State/com.electron.console.savedState/",
  ]
end
