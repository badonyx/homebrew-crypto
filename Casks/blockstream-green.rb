cask "blockstream-green" do
  version "1.2.6"
  sha256 "9110ba0f1490a3baedbaaaec9c4a7bf8f511bb9c1f2f81655e6be6ee1c71b40b"

  url "https://github.com/Blockstream/green_qt/releases/download/release_#{version}/BlockstreamGreen_MacOS_x86_64.zip",
      verified: "github.com/Blockstream/green_qt/"
  name "Blockstream Green"
  desc "Multi-platform, feature-rich Bitcoin and Liquid wallet"
  homepage "https://blockstream.com/green/"

  livecheck do
    url :url
    strategy :github_latest
  end

  container nested: "Blockstream Green.dmg"

  app "Blockstream Green.app"

  zap trash: [
    "~/Library/Application Support/Blockstream",
    "~/Library/Caches/Blockstream",
    "~/Library/Saved Application State/com.blockstream.Green.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
