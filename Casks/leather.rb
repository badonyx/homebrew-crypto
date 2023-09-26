cask "leather" do
  version "4.14.1"
  sha256 "2591dc713eed4f67685e47cd5a5fc04d4aa5b54a7401a7c279ae699c068e1598"

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
