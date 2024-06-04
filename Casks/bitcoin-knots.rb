cask "bitcoin-knots" do
  arch arm: "arm64", intel: "x86_64"

  version "26.1.knots20240513"
  sha256 arm:   "6e2597fb1f8166c6545741d44de92ebe56ac70257a38fd350580880fe13e0cab",
         intel: "d6642d7e1ccc36483f146c03c493a2904d079b8614dbdfb14701bdc833736ad5"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin.dmg",
      verified: "github.com/bitcoinknots/bitcoin/"
  name "Bitcoin Knots"
  desc "Enhanced Bitcoin node/wallet software"
  homepage "https://bitcoinknots.org/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\w+)+)/i)
  end

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Bitcoin-Qt.app", target: "Bitcoin Knots.app"

  preflight do
    set_permissions "#{staged_path}/Bitcoin-Qt.app", "0755"
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{staged_path}/Bitcoin-Qt.app"]
  end

  caveats do
    requires_rosetta
  end
end
