cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "27.1.knots20240621"
  sha256 arm:   "2041f45f8438a2dfec1ff40718769351c74f8e3a71b0849dab92ae477aba144a",
         intel: "d5648998abd431511d7d25ce9c3246322d07a136c9478d895f7911820f82a7d5"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.zip",
      verified: "github.com/bitcoinknots/bitcoin/"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"
end
