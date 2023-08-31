cask "hiro-wallet" do
  version "4.10.1"
  sha256 "0ed51289872b97e39e8f1e934f67353cd7e9e0b92500f336e3114065860d2594"

  url "https://github.com/hirosystems/desktop-wallet/releases/download/v#{version}/stacks-wallet.mainnet.v#{version}.dmg",
      verified: "github.com/hirosystems/desktop-wallet/"
  name "Hiro Wallet"
  desc "Desktop wallet for Stacks blockchain"
  homepage "https://wallet.hiro.so/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Hiro Wallet.app"

  zap trash: [
    "~/Library/Application Support/so.hiro.StacksWallet",
    "~/Library/Preferences/so.hiro.StacksWallet.plist",
    "~/Library/Saved Application State/so.hiro.StacksWallet.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
