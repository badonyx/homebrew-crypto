cask "leather" do
  version "4.14.3"
  sha256 "6d2aa7d6b98aef262e05a469e9080f43f780849ad9b18b9143bf14799a19738b"

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
