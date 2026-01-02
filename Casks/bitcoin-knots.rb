cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "29.2.knots20251110"
  sha256 arm:   "db162ae8b6198278da6657d00eddf6f642fd5dccdbc32b124fad6a26e6f4ece1",
         intel: "a736c6a64f4e300ef0cda8d0106f341daad86fb1012eeeaf3e5136c556eba660"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.zip",
      verified: "github.com/bitcoinknots/bitcoin/"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  depends_on macos: ">= :ventura"

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"
end
