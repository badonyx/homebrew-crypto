cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "29.4.2.knots20260508"
  sha256 arm:   "325d222cd02e2d5e678124d86adfc5f69ab3de6e278d49ba6385888ca2c99d9f",
         intel: "225f6bfa7d674979b8cb987bb7168f7b02183d88a79b82846ebfab998f0516d9"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.zip"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  depends_on macos: :ventura

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"
end
