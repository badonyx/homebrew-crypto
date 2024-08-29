cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "27.1.knots20240801"
  sha256 arm:   "030587371794f02c1f847b28638e139e9c3ceedf6512b2fdab5c8500e8ea01e3",
         intel: "ec33a8a9e66c3d0aa6738cb72853526f5949e819d69e695aff5138916adf4243"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.zip",
      verified: "github.com/bitcoinknots/bitcoin/"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"
end
