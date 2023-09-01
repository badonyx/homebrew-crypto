cask "leather" do
  version "4.14.0"
  sha256 "e6a357517cdca5f4701f423e9c3e59e6a88a5042fc63b89f25685077f2e4ecf2"

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
