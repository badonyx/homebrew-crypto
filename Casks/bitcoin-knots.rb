cask "bitcoin-knots" do
  version "23.0.knots20220529"
  sha256 "c3fbda586536bfc9d9053b04fe51f6f40b98b56f6388380bd1384b258debd470"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-x86_64-apple-darwin-unsigned.dmg",
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

  # Shared config?
  # zap trash: [
  #   "~/Library/Preferences/org.bitcoin.Bitcoin-Qt.plist",
  # ]

  caveats do
    requires_rosetta
    <<~EOS
      The Apple Silicon build for this cask is not functional so the Intel build is
      required instead.
        https://github.com/orgs/Homebrew/discussions/3088#discussioncomment-7623916
    EOS
  end
end
