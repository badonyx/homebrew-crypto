cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "29.4.knots20260508"
  sha256 arm:   "4218c01abf01aad7086dc4a1c332c0ea3e110aacf65dc6bc7e1f35d443725acb",
         intel: "c054aef2142be9cbb247515bb2cdc302672d7676ab81a5e91cfe8f61271534d1"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.zip"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  depends_on macos: :ventura

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"
end
