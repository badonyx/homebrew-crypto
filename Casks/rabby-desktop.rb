cask "rabby-desktop" do
  arch arm: "arm64", intel: "x64"

  version "0.36.4"
  sha256 :no_check

  url "https://download.rabby.io/wallet-desktop/darwin-#{arch}/rabby-wallet-desktop-installer-#{arch}-latest.dmg"
  name "Rabby Desktop"
  desc "Desktop wallet for Ethereum and EVM chains"
  homepage "https://rabby.io/"

  livecheck do
    strategy :extract_plist
  end

  app "Rabby Desktop.app"

  zap trash: [
    "~/Library/Application Support/rabby-desktop",
    "~/Library/Logs/rabby-desktop",
    "~/Library/Preferences/com.debank.RabbyDesktop.plist",
    "~/Library/Saved Application State/com.debank.RabbyDesktop.savedState",
  ]
end
