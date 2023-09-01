cask "bitcoin-knots" do
  arch intel: "x86_64",
       arm:   "arm64"

  version "23.0.knots20220529"
  sha256 intel: "c3fbda586536bfc9d9053b04fe51f6f40b98b56f6388380bd1384b258debd470",
         arm:   "8ec07b672dbbf2c495962d6b484a6af608627adeb2435ab87b46546e815826a1"

  url "https://github.com/bitcoinknots/bitcoin/releases/download/v#{version}/bitcoin-#{version}-#{arch}-apple-darwin-unsigned.dmg",
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

  zap trash: [
    # "~/Library/Preferences/org.bitcoin.Bitcoin-Qt.plist",
  ]

  caveats <<~EOS
    This app is not signed with an Apple Developer certificate. Therefore in order
    to run it may be necessary to override the macOS security policy. This can be
    done with homebrew using the `--no-quarantine` option:

      brew reinstall --cask --no-quarantine #{token}

    This app may not run even with this mitigation.
  EOS
end
