cask "leather" do
  version "4.15.1"
  sha256 "9e6c39294f3a6c58a6cc437e9674845b1573943a40738973c6e8c48ff5d7bc91"

  url "https://github.com/leather-wallet/desktop/releases/download/v#{version}/leather-wallet.mainnet.v#{version}.dmg",
      verified: "github.com/leather-wallet/desktop/"
  name "Leather Wallet"
  desc "Desktop wallet for Stacks blockchain"
  homepage "https://leather.io/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Leather.app"

  zap trash: [
    "~/Library/Application Support/Leather",
    "~/Library/Application Support/so.hiro.StacksWallet",
    "~/Library/Preferences/so.hiro.StacksWallet.plist",
    "~/Library/Saved Application State/so.hiro.StacksWallet.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
